import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../order/domain/entities/order_entity.dart';
import '../providers/admin_providers.dart';

String _statusLabel(AppLocalizations l10n, OrderStatus status) {
  return switch (status) {
    OrderStatus.pending => l10n.adminOrderStatusPending,
    OrderStatus.accepted => l10n.adminOrderStatusAccepted,
    OrderStatus.inProgress => l10n.adminOrderStatusInProgress,
    OrderStatus.completed => l10n.adminOrderStatusCompleted,
    OrderStatus.cancelled => l10n.adminOrderStatusCancelled,
  };
}

Color _statusColor(OrderStatus status) {
  return switch (status) {
    OrderStatus.pending => Colors.orange,
    OrderStatus.accepted => Colors.blue,
    OrderStatus.inProgress => Colors.blue,
    OrderStatus.completed => Colors.green,
    OrderStatus.cancelled => Colors.red,
  };
}

String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}.'
      '${date.month.toString().padLeft(2, '0')}.'
      '${date.year}';
}

class AdminOrdersScreen extends ConsumerWidget {
  const AdminOrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final orders = ref.watch(adminOrdersProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.adminStatOrders)),
      body: orders.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.adminNoOrders, icon: Icons.receipt_long_outlined);
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final order = items[index];
              return ListTile(
                leading: Icon(
                  order.targetType == OrderTargetType.material
                      ? Icons.inventory_2_outlined
                      : Icons.handyman_outlined,
                ),
                title: Text(
                  order.targetType == OrderTargetType.material
                      ? l10n.adminOrderTargetMaterial
                      : l10n.adminOrderTargetWorker,
                ),
                subtitle: Text(
                  [
                    _formatDate(order.createdAt),
                    if (order.totalPrice != null) '${order.totalPrice!.toStringAsFixed(2)} ₼',
                  ].join(' · '),
                ),
                trailing: Chip(
                  label: Text(_statusLabel(l10n, order.status)),
                  backgroundColor: _statusColor(order.status).withValues(alpha: 0.15),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
