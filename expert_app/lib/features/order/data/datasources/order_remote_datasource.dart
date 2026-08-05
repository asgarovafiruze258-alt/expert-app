import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderModel> createOrder({
    required String customerId,
    required String targetType,
    required String targetId,
    String? address,
    String? scheduledDate,
    String? notes,
  });

  Future<void> createMaterialOrder({
    required List<Map<String, dynamic>> items,
    String? address,
    String? scheduledDate,
    String? notes,
  });
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final SupabaseClient client;

  const OrderRemoteDataSourceImpl(this.client);

  @override
  Future<OrderModel> createOrder({
    required String customerId,
    required String targetType,
    required String targetId,
    String? address,
    String? scheduledDate,
    String? notes,
  }) async {
    try {
      final row = await client
          .from('orders')
          .insert({
            'customer_id': customerId,
            'target_type': targetType,
            'target_id': targetId,
            'address': address,
            'scheduled_date': scheduledDate,
            'notes': notes,
          })
          .select()
          .single();
      return OrderModel.fromJson(row);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<void> createMaterialOrder({
    required List<Map<String, dynamic>> items,
    String? address,
    String? scheduledDate,
    String? notes,
  }) async {
    try {
      await client.rpc('create_material_order', params: {
        'p_items': items,
        'p_address': address,
        'p_scheduled_date': scheduledDate,
        'p_notes': notes,
      });
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    }
  }
}
