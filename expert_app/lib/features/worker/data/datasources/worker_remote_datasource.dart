import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/worker_model.dart';

const _workerSelect =
    '*, profiles(full_name, avatar_url), worker_categories(categories(name))';

abstract class WorkerRemoteDataSource {
  Future<List<WorkerModel>> getWorkers({String? categoryId});
  Future<WorkerModel> getWorkerDetail(String id);
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
}
