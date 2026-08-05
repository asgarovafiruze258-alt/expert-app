import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../material/data/models/material_model.dart';
import '../models/shop_model.dart';

abstract class ShopRemoteDataSource {
  Future<ShopModel> getShopDetail(String id);
  Future<List<MaterialModel>> getShopMaterials(String shopId);
}

class ShopRemoteDataSourceImpl implements ShopRemoteDataSource {
  final SupabaseClient client;

  const ShopRemoteDataSourceImpl(this.client);

  @override
  Future<ShopModel> getShopDetail(String id) async {
    try {
      final row = await client.from('shops').select().eq('id', id).single();
      return ShopModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MaterialModel>> getShopMaterials(String shopId) async {
    try {
      final rows = await client
          .from('materials')
          .select('*, shops(name)')
          .eq('shop_id', shopId)
          .order('created_at', ascending: false);
      return (rows as List)
          .map((row) => MaterialModel.fromJson(row as Map<String, dynamic>))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
