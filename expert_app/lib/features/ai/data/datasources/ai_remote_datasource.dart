import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AiRemoteDataSource {
  Future<String> invoke({
    required String mode,
    required String prompt,
    List<Map<String, String>>? history,
  });
}

class AiRemoteDataSourceImpl implements AiRemoteDataSource {
  final SupabaseClient client;

  const AiRemoteDataSourceImpl(this.client);

  @override
  Future<String> invoke({
    required String mode,
    required String prompt,
    List<Map<String, String>>? history,
  }) async {
    try {
      final response = await client.functions.invoke('ai-assistant', body: {
        'mode': mode,
        'prompt': prompt,
        'history': ?history,
      });
      final data = response.data;
      if (data is Map && data['error'] != null) {
        throw ServerException(data['error'].toString());
      }
      if (data is Map && data['text'] is String) {
        return data['text'] as String;
      }
      throw const ServerException('AI cavabı gözlənilməz formatda gəldi');
    } on FunctionException catch (e) {
      throw ServerException(e.toString());
    }
  }
}
