import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/worker_model.dart';

const _workerSelect =
    '*, profiles(full_name, avatar_url), worker_categories(categories(name))';

abstract class WorkerRemoteDataSource {
  Future<List<WorkerModel>> getWorkers({String? categoryId});
  Future<WorkerModel> getWorkerDetail(String id);
  Future<WorkerModel?> getMyWorkerProfile();
  Future<WorkerModel> createWorkerProfile({
    required String bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    String? contactPhone,
    required List<String> categoryIds,
  });
}

class WorkerRemoteDataSourceImpl implements WorkerRemoteDataSource {
  final SupabaseClient client;

  const WorkerRemoteDataSourceImpl(this.client);

  @override
  Future<List<WorkerModel>> getWorkers({String? categoryId}) async {
    try {
      if (categoryId != null) {
        final rows = await client
            .from('workers')
            .select('$_workerSelect, worker_categories!inner(category_id)')
            .eq('is_approved', true)
            .eq('worker_categories.category_id', categoryId)
            .order('rating', ascending: false);
        return (rows as List)
            .map((row) => WorkerModel.fromJson(row as Map<String, dynamic>))
            .toList();
      }

      final rows = await client
          .from('workers')
          .select(_workerSelect)
          .eq('is_approved', true)
          .order('rating', ascending: false);
      return (rows as List)
          .map((row) => WorkerModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<WorkerModel> getWorkerDetail(String id) async {
    try {
      final row = await client.from('workers').select(_workerSelect).eq('id', id).single();
      return WorkerModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<WorkerModel?> getMyWorkerProfile() async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      final row =
          await client.from('workers').select(_workerSelect).eq('id', userId).maybeSingle();
      return row == null ? null : WorkerModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<WorkerModel> createWorkerProfile({
    required String bio,
    required int experienceYears,
    double? priceFrom,
    double? priceTo,
    required List<String> serviceAreas,
    String? contactPhone,
    required List<String> categoryIds,
  }) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      await client.from('workers').insert({
        'id': userId,
        'bio': bio,
        'experience_years': experienceYears,
        'price_from': priceFrom,
        'price_to': priceTo,
        'service_areas': serviceAreas,
        'contact_phone': contactPhone,
      });
      if (categoryIds.isNotEmpty) {
        await client.from('worker_categories').insert(
              categoryIds.map((categoryId) => {'worker_id': userId, 'category_id': categoryId}).toList(),
            );
      }
      final row = await client.from('workers').select(_workerSelect).eq('id', userId).single();
      return WorkerModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
