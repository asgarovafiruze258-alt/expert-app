import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/recently_viewed_model.dart';

abstract class RecentlyViewedLocalDataSource {
  Future<List<RecentlyViewedModel>> getAll();
  Future<void> add(RecentlyViewedModel model);
}

class RecentlyViewedLocalDataSourceImpl implements RecentlyViewedLocalDataSource {
  static const _prefsKey = 'expert_recently_viewed';
  static const _maxItems = 20;

  final SharedPreferences prefs;

  const RecentlyViewedLocalDataSourceImpl(this.prefs);

  @override
  Future<List<RecentlyViewedModel>> getAll() async {
    final raw = prefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) return [];
    final list = jsonDecode(raw) as List;
    return list
        .map((e) => RecentlyViewedModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<void> add(RecentlyViewedModel model) async {
    final current = await getAll();
    current.removeWhere((e) => e.type == model.type && e.id == model.id);
    current.insert(0, model);
    final trimmed = current.take(_maxItems).toList();
    await prefs.setString(_prefsKey, jsonEncode(trimmed.map((e) => e.toJson()).toList()));
  }
}
