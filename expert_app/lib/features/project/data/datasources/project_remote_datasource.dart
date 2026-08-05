import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/project_item_model.dart';
import '../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getProjects(String userId);
  Future<ProjectModel> getProjectDetail(String id);
  Future<ProjectModel> createProject({
    required String userId,
    required String title,
    int? roomCount,
    double? budgetPlanned,
  });
  Future<void> updateProjectStatus({required String id, required String status});
  Future<void> deleteProject(String id);

  Future<List<ProjectItemModel>> getProjectItems(String projectId);
  Future<ProjectItemModel> addProjectItem({
    required String projectId,
    required String itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  });
  Future<void> updateProjectItemActualCost({required String id, required double actualCost});
  Future<void> deleteProjectItem(String id);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  final SupabaseClient client;

  const ProjectRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProjectModel>> getProjects(String userId) async {
    try {
      final rows = await client
          .from('projects')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return (rows as List)
          .map((row) => ProjectModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ProjectModel> getProjectDetail(String id) async {
    try {
      final row = await client.from('projects').select().eq('id', id).single();
      return ProjectModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ProjectModel> createProject({
    required String userId,
    required String title,
    int? roomCount,
    double? budgetPlanned,
  }) async {
    try {
      final row = await client
          .from('projects')
          .insert({
            'user_id': userId,
            'title': title,
            'room_count': roomCount,
            'budget_planned': budgetPlanned,
          })
          .select()
          .single();
      return ProjectModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> updateProjectStatus({required String id, required String status}) async {
    try {
      await client.from('projects').update({'status': status}).eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteProject(String id) async {
    try {
      await client.from('projects').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<ProjectItemModel>> getProjectItems(String projectId) async {
    try {
      final rows = await client
          .from('project_items')
          .select()
          .eq('project_id', projectId)
          .order('created_at');
      return (rows as List)
          .map((row) => ProjectItemModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ProjectItemModel> addProjectItem({
    required String projectId,
    required String itemType,
    required String label,
    required double estimatedCost,
    double? actualCost,
  }) async {
    try {
      final row = await client
          .from('project_items')
          .insert({
            'project_id': projectId,
            'item_type': itemType,
            'label': label,
            'estimated_cost': estimatedCost,
            'actual_cost': actualCost,
          })
          .select()
          .single();
      return ProjectItemModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> updateProjectItemActualCost({required String id, required double actualCost}) async {
    try {
      await client.from('project_items').update({'actual_cost': actualCost}).eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> deleteProjectItem(String id) async {
    try {
      await client.from('project_items').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
