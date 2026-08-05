import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime? _scheduledDate;

  @override
  void dispose() {
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _scheduledDate = picked);
  }

  Future<void> _checkout() async {
    final l10n = AppLocalizations.of(context);
    final success = await ref.read(cartCheckoutControllerProvider.notifier).submit(
          address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
          scheduledDate: _scheduledDate,
          notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
        );
    if (!mounted) return;
    if (success) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.orderCreatedSuccess)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);

    ref.listen(cartCheckoutControllerProvider, (previous, next) {
      final error = next.error;
      if (error is Failure) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(error.message)));
      }
    });

    final isLoading = ref.watch(cartCheckoutControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.cartTitle)),
      body: items.isEmpty
          ? EmptyStateView(message: l10n.cartEmpty, icon: Icons.shopping_cart_outlined)
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              children: [
                for (final item in items) _CartItemTile(item: item),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(l10n.cartTotalLabel, style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      '${total.toStringAsFixed(0)}₼',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: _addressController,
                  label: l10n.orderAddressLabel,
                  prefixIcon: Icons.location_on_outlined,
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_today_outlined),
                  label: Text(
                    _scheduledDate == null
                        ? l10n.orderPickDate
                        : '${_scheduledDate!.day}.${_scheduledDate!.month}.${_scheduledDate!.year}',
                  ),
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: _notesController,
                  label: l10n.orderNotesLabel,
                  prefixIcon: Icons.notes_outlined,
                ),
                const SizedBox(height: 20),
                AppButton(
                  label: l10n.cartCheckoutButton,
                  isLoading: isLoading,
                  onPressed: _checkout,
                ),
              ],
            ),
    );
  }
}

class _CartItemTile extends ConsumerWidget {
  final CartItemEntity item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final imageUrl = item.material.images.isNotEmpty ? item.material.images.first : null;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 64,
              height: 64,
              child: imageUrl != null
                  ? CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover)
                  : Container(
                      color: theme.colorScheme.surfaceContainerHighest,
                      child: const Icon(Icons.inventory_2_outlined),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.material.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(
                  '${item.unitPrice.toStringAsFixed(0)}₼ x ${item.quantity} = ${item.lineTotal.toStringAsFixed(0)}₼',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                      onPressed: () => ref
                          .read(cartProvider.notifier)
                          .updateQuantity(item.material.id, item.quantity - 1),
                    ),
                    Text('${item.quantity}'),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Icons.add_circle_outline, size: 20),
                      onPressed: item.quantity < item.material.stockQty
                          ? () => ref
                              .read(cartProvider.notifier)
                              .updateQuantity(item.material.id, item.quantity + 1)
                          : null,
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => ref.read(cartProvider.notifier).removeItem(item.material.id),
          ),
        ],
      ),
    );
  }
}
