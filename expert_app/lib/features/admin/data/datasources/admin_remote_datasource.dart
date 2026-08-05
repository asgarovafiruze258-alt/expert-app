import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../home/data/models/category_model.dart';
import '../../../shop/data/models/shop_model.dart';
import '../../../worker/data/models/worker_model.dart';
import '../../domain/entities/admin_stats_entity.dart';

const _adminWorkerSelect =
    '*, profiles(full_name, avatar_url), worker_categories(categories(name))';

abstract class AdminRemoteDataSource {
  Future<AdminStatsEntity> getStats();

  Future<List<CategoryModel>> getAllCategories();
  Future<CategoryModel> createCategory({
    required String name,
    String? nameEn,
    String? nameRu,
    required String type,
  });
  Future<CategoryModel> updateCategory({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
  });
  Future<void> deleteCategory(String id);

  Future<List<WorkerModel>> getPendingWorkers();
  Future<void> approveWorker(String id);
  Future<void> rejectWorker(String id);

  Future<List<ShopModel>> getPendingShops();
  Future<void> approveShop(String id);
  Future<void> rejectShop(String id);

  Future<List<UserModel>> getUsers();
  Future<void> updateUserRole({required String userId, required String role});
}

class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final SupabaseClient client;

  const AdminRemoteDataSourceImpl(this.client);

  @override
  Future<AdminStatsEntity> getStats() async {
    try {
      final results = await Future.wait([
        client.from('profiles').select('id').count(CountOption.exact),
        client.from('workers').select().count(CountOption.exact),
        client.from('workers').select().eq('is_approved', false).count(CountOption.exact),
        client.from('shops').select().count(CountOption.exact),
        client.from('shops').select().eq('is_approved', false).count(CountOption.exact),
        client.from('materials').select().count(CountOption.exact),
        client.from('orders').select().count(CountOption.exact),
      ]);
      return AdminStatsEntity(
        userCount: results[0].count,
        workerCount: results[1].count,
        pendingWorkerCount: results[2].count,
        shopCount: results[3].count,
        pendingShopCount: results[4].count,
        materialCount: results[5].count,
        orderCount: results[6].count,
      );
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final rows = await client.from('categories').select().order('type').order('name');
      return (rows as List)
          .map((row) => CategoryModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<CategoryModel> createCategory({
    required String name,
    String? nameEn,
    String? nameRu,
    required String type,
  }) async {
    try {
      final row = await client
          .from('categories')
          .insert({'name': name, 'name_en': nameEn, 'name_ru': nameRu, 'type': type})
          .select()
          .single();
      return CategoryModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<CategoryModel> updateCategory({
    required String id,
    required String name,
    String? nameEn,
    String? nameRu,
  }) async {
    try {
      final row = await client
          .from('categories')
          .update({'name': name, 'name_en': nameEn, 'name_ru': nameRu})
          .eq('id', id)
          .select()
          .single();
      return CategoryModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      await client.from('categories').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<WorkerModel>> getPendingWorkers() async {
    try {
      final rows = await client
          .from('workers')
          .select(_adminWorkerSelect)
          .eq('is_approved', false)
          .order('created_at');
      return (rows as List)
          .map((row) => WorkerModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> approveWorker(String id) async {
    try {
      await client.from('workers').update({'is_approved': true}).eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> rejectWorker(String id) async {
    try {
      await client.from('workers').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<ShopModel>> getPendingShops() async {
    try {
      final rows =
          await client.from('shops').select().eq('is_approved', false).order('created_at');
      return (rows as List)
          .map((row) => ShopModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> approveShop(String id) async {
    try {
      await client.from('shops').update({'is_approved': true}).eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> rejectShop(String id) async {
    try {
      await client.from('shops').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      // `phone` sütunu adi cədvəl sorğusu ilə oxuna bilmir (bax
      // SUPABASE_MIGRATION_17.sql) — admin üçün nəzərdə tutulan, admin
      // olduğunu yoxlayan SECURITY DEFINER RPC-dən istifadə olunur.
      final rows = await client.rpc('admin_list_profiles');
      return (rows as List)
          .map((row) => UserModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> updateUserRole({required String userId, required String role}) async {
    try {
      await client.from('profiles').update({'role': role}).eq('id', userId);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
