import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/favorite_entity.dart';
import '../providers/favorite_providers.dart';

class FavoriteButton extends ConsumerWidget {
  final FavoriteTargetType targetType;
  final String targetId;

  const FavoriteButton({super.key, required this.targetType, required this.targetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idsAsync = ref.watch(favoriteIdsProvider(targetType));
    final isFavorite = idsAsync.value?.contains(targetId) ?? false;

    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: isFavorite ? Colors.red : null,
      onPressed: () => toggleFavorite(ref, targetType, targetId),
    );
  }
}
