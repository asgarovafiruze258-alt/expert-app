import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../material/data/models/material_model.dart';
import '../models/shop_model.dart';

abstract class ShopRemoteDataSource {
  Future<ShopModel> getShopDetail(String id);
  Future<List<MaterialModel>> getShopMaterials(String shopId);
  Future<ShopModel?> getMyShop();
  Future<ShopModel> createShop({
    required String name,
    String? address,
    String? rayon,
    double? latitude,
    double? longitude,
    String? contactPhone,
    required List<String> categoryIds,
  });
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

  @override
  Future<ShopModel?> getMyShop() async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      final row = await client.from('shops').select().eq('owner_id', userId).maybeSingle();
      return row == null ? null : ShopModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ShopModel> createShop({
    required String name,
    String? address,
    String? rayon,
    double? latitude,
    double? longitude,
    String? contactPhone,
    required List<String> categoryIds,
  }) async {
    final userId = client.auth.currentUser?.id;
    if (userId == null) throw const UnauthorizedException();
    try {
      final inserted = await client
          .from('shops')
          .insert({
            'owner_id': userId,
            'name': name,
            'address': address,
            'rayon': rayon,
            'latitude': latitude,
            'longitude': longitude,
            'contact_phone': contactPhone,
          })
          .select()
          .single();
      final shopId = inserted['id'] as String;
      if (categoryIds.isNotEmpty) {
        await client.from('shop_categories').insert(
              categoryIds.map((categoryId) => {'shop_id': shopId, 'category_id': categoryId}).toList(),
            );
      }
      return ShopModel.fromJson(inserted);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
