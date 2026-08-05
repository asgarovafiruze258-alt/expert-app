import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/worker_entity.dart';

/// Sabit en tələb etmir — çağıran tərəf (üfüqi siyahıda SizedBox, grid-də
/// hüceyrə ölçüsü) genişliyi müəyyən edir.
class WorkerCard extends StatelessWidget {
  final WorkerEntity worker;
  final VoidCallback? onTap;

  const WorkerCard({super.key, required this.worker, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage: worker.avatarUrl != null
                        ? CachedNetworkImageProvider(worker.avatarUrl!)
                        : null,
                    child: worker.avatarUrl == null
                        ? Text(worker.fullName.isNotEmpty ? worker.fullName[0].toUpperCase() : '?')
                        : null,
                  ),
                  if (worker.isOnline)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: theme.colorScheme.surface, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                worker.fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  const SizedBox(width: 2),
                  Text(worker.rating.toStringAsFixed(1), style: theme.textTheme.bodySmall),
                  Text(' (${worker.reviewCount})', style: theme.textTheme.bodySmall),
                ],
              ),
              if (worker.priceFrom != null) ...[
                const SizedBox(height: 4),
                Text(
                  '${worker.priceFrom!.toStringAsFixed(0)}₼-dən',
                  style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
