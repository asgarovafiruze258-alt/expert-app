import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../material/data/models/material_model.dart';
import '../../../worker/data/models/worker_model.dart';
import '../models/category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getCategories({required String type});
  Future<List<WorkerModel>> getPopularWorkers({int limit = 10});
  Future<List<MaterialModel>> getPopularMaterials({int limit = 10});
  Future<List<MaterialModel>> getDiscountedMaterials({int limit = 10});
  Future<List<WorkerModel>> searchWorkers(String query);
  Future<List<MaterialModel>> searchMaterials(String query);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final SupabaseClient client;

  const HomeRemoteDataSourceImpl(this.client);

  @override
  Future<List<CategoryModel>> getCategories({required String type}) async {
    try {
      final rows = await client
          .from('categories')
          .select()
          .eq('type', type)
          .order('name');
      return (rows as List)
          .map((row) => CategoryModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<WorkerModel>> getPopularWorkers({int limit = 10}) async {
    try {
      final rows = await client
          .from('workers')
          .select('*, profiles(full_name, avatar_url)')
          .eq('is_approved', true)
          .order('rating', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((row) => WorkerModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MaterialModel>> getPopularMaterials({int limit = 10}) async {
    try {
      final rows = await client
          .from('materials')
          .select('*, shops(name)')
          .eq('is_featured', true)
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MaterialModel>> getDiscountedMaterials({int limit = 10}) async {
    try {
      final rows = await client
          .from('materials')
          .select('*, shops(name)')
          .not('discount_price', 'is', null)
          .order('created_at', ascending: false)
          .limit(limit);
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<WorkerModel>> searchWorkers(String query) async {
    try {
      final rows = await client
          .from('workers')
          .select('*, profiles!inner(full_name, avatar_url)')
          .eq('is_approved', true)
          .ilike('profiles.full_name', '%$query%')
          .limit(20);
      return (rows as List)
          .map((row) => WorkerModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MaterialModel>> searchMaterials(String query) async {
    try {
      final rows = await client
          .from('materials')
          .select('*, shops(name)')
          .ilike('name', '%$query%')
          .limit(20);
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
