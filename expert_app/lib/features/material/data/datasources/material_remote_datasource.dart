import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/material_model.dart';

const _materialSelect = '*, shops(name)';

abstract class MaterialRemoteDataSource {
  Future<List<MaterialModel>> getMaterials({String? categoryId, bool? sortByPriceAsc});
  Future<MaterialModel> getMaterialDetail(String id);
  Future<List<MaterialModel>> getSimilarInOtherShops({
    required String name,
    required String excludeMaterialId,
  });
}

class MaterialRemoteDataSourceImpl implements MaterialRemoteDataSource {
  final SupabaseClient client;

  const MaterialRemoteDataSourceImpl(this.client);

  @override
  Future<List<MaterialModel>> getMaterials({String? categoryId, bool? sortByPriceAsc}) async {
    try {
      var query = client.from('materials').select(_materialSelect);
      if (categoryId != null) {
        query = query.eq('category_id', categoryId);
      }
      final builder = sortByPriceAsc != null
          ? query.order('price', ascending: sortByPriceAsc)
          : query.order('created_at', ascending: false);
      final rows = await builder;
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<MaterialModel> getMaterialDetail(String id) async {
    try {
      final row = await client.from('materials').select(_materialSelect).eq('id', id).single();
      return MaterialModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MaterialModel>> getSimilarInOtherShops({
    required String name,
    required String excludeMaterialId,
  }) async {
    try {
      final rows = await client
          .from('materials')
          .select(_materialSelect)
          .ilike('name', name)
          .neq('id', excludeMaterialId)
          .order('price')
          .limit(10);
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
