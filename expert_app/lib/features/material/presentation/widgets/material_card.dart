import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/material_entity.dart';

/// Sabit en tələb etmir — çağıran tərəf (üfüqi siyahıda SizedBox, grid-də
/// hüceyrə ölçüsü) genişliyi müəyyən edir.
class MaterialCard extends StatelessWidget {
  final MaterialEntity material;
  final VoidCallback? onTap;

  const MaterialCard({super.key, required this.material, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = material.images.isNotEmpty ? material.images.first : null;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: imageUrl != null
                  ? CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover)
                  : Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: const Icon(Icons.inventory_2_outlined, size: 32),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    material.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                  ),
                  if (material.shopName != null)
                    Text(
                      material.shopName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall,
                    ),
                  const SizedBox(height: 4),
                  if (material.hasDiscount)
                    Row(
                      children: [
                        Text(
                          '${material.discountPrice!.toStringAsFixed(0)}₼',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.error,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '${material.price.toStringAsFixed(0)}₼',
                          style: theme.textTheme.bodySmall?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      '${material.price.toStringAsFixed(0)}₼ / ${material.unit}',
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
