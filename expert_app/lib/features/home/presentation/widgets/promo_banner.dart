import 'package:flutter/material.dart';

/// PRD-də qərar verildiyi kimi (bax docs/PRD.md §5), MVP-də dinamik reklam/endirim
/// sistemi yoxdur — statik banner istifadə olunur. Real reklam idarəetməsi V1.x-də əlavə olunacaq.
class PromoBanner extends StatelessWidget {
  final String title;
  final String subtitle;

  const PromoBanner({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.colorScheme.primary, theme.colorScheme.primary.withValues(alpha: 0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(color: Colors.white.withValues(alpha: 0.9)),
                ),
              ],
            ),
          ),
          const Icon(Icons.home_repair_service_outlined, color: Colors.white, size: 40),
        ],
      ),
    );
  }
}
