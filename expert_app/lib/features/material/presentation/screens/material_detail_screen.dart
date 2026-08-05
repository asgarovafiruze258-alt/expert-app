import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../favorite/domain/entities/favorite_entity.dart';
import '../../../favorite/presentation/widgets/favorite_button.dart';
import '../../../order/presentation/providers/cart_provider.dart';
import '../../../order/presentation/widgets/cart_icon_button.dart';
import '../../domain/entities/material_entity.dart';
import '../providers/material_providers.dart';
import '../widgets/material_card.dart';

class MaterialDetailScreen extends ConsumerStatefulWidget {
  final String materialId;

  const MaterialDetailScreen({super.key, required this.materialId});

  @override
  ConsumerState<MaterialDetailScreen> createState() => _MaterialDetailScreenState();
}

class _MaterialDetailScreenState extends ConsumerState<MaterialDetailScreen> {
  int _quantity = 1;

  void _addToCart(MaterialEntity material) {
    final l10n = AppLocalizations.of(context);
    ref.read(cartProvider.notifier).addItem(material, _quantity);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(l10n.materialAddedToCart)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final materialAsync = ref.watch(materialDetailProvider(widget.materialId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          FavoriteButton(targetType: FavoriteTargetType.material, targetId: widget.materialId),
          const CartIconButton(),
        ],
      ),
      body: materialAsync.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (material) {
          final theme = Theme.of(context);
          final inStock = material.stockQty > 0;
          final maxQty = material.stockQty > 0 ? material.stockQty : 1;
          if (_quantity > maxQty) _quantity = maxQty;

          return ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              AspectRatio(
                aspectRatio: 1.4,
                child: material.images.isNotEmpty
                    ? PageView(
                        children: material.images
                            .map((url) => CachedNetworkImage(imageUrl: url, fit: BoxFit.cover))
                            .toList(),
                      )
                    : Container(
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: const Icon(Icons.inventory_2_outlined, size: 48),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(material.name, style: theme.textTheme.titleLarge),
                    if (material.shopName != null) ...[
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () => context.push('/shops/${material.shopId}'),
                        child: Text(
                          material.shopName!,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.primary),
                        ),
                      ),
                    ],
                    const SizedBox(height: 12),
                    if (material.hasDiscount)
                      Row(
                        children: [
                          Text(
                            '${material.discountPrice!.toStringAsFixed(0)}₼',
                            style: theme.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w700, color: theme.colorScheme.error),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${material.price.toStringAsFixed(0)}₼',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      )
                    else
                      Text(
                        '${material.price.toStringAsFixed(0)}₼ / ${material.unit}',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          inStock ? Icons.check_circle_outline : Icons.cancel_outlined,
                          size: 18,
                          color: inStock ? Colors.green : theme.colorScheme.error,
                        ),
                        const SizedBox(width: 6),
                        Text(inStock ? l10n.materialInStock(material.stockQty) : l10n.materialOutOfStock),
                      ],
                    ),
                    if (material.description != null && material.description!.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(material.description!, style: theme.textTheme.bodyMedium),
                    ],
                    const SizedBox(height: 20),
                    if (inStock) ...[
                      Text(l10n.materialQuantityLabel, style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          IconButton(
                            onPressed: _quantity > 1 ? () => setState(() => _quantity--) : null,
                            icon: const Icon(Icons.remove_circle_outline),
                          ),
                          Text('$_quantity', style: theme.textTheme.titleMedium),
                          IconButton(
                            onPressed:
                                _quantity < maxQty ? () => setState(() => _quantity++) : null,
                            icon: const Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                    AppButton(
                      label: l10n.materialAddToCart,
                      onPressed: inStock ? () => _addToCart(material) : null,
                      icon: Icons.add_shopping_cart_outlined,
                    ),
                    const SizedBox(height: 24),
                    Consumer(
                      builder: (context, ref, _) {
                        final similar = ref.watch(similarMaterialsProvider(
                          (name: material.name, excludeMaterialId: material.id),
                        ));
                        return similar.when(
                          loading: () => const SizedBox.shrink(),
                          error: (error, _) => const SizedBox.shrink(),
                          data: (items) {
                            if (items.isEmpty) return const SizedBox.shrink();
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.materialOtherShops, style: theme.textTheme.titleMedium),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 210,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: items.length,
                                    separatorBuilder: (_, _) => const SizedBox(width: 10),
                                    itemBuilder: (context, index) => SizedBox(
                                      width: 160,
                                      child: MaterialCard(
                                        material: items[index],
                                        onTap: () => context.push('/materials/${items[index].id}'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
