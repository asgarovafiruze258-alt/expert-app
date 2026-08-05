import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/notification_entity.dart';
import '../providers/notification_providers.dart';

IconData _iconForType(NotificationType type) {
  return switch (type) {
    NotificationType.newOrder => Icons.receipt_long_outlined,
    NotificationType.newMessage => Icons.chat_bubble_outline,
    NotificationType.priceDrop => Icons.trending_down,
    NotificationType.orderConfirmed => Icons.check_circle_outline,
  };
}

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  Future<void> _onTap(BuildContext context, WidgetRef ref, NotificationEntity notification) async {
    if (!notification.isRead) {
      await markNotificationAsRead(ref, notification.id);
    }
    if (!context.mounted) return;
    if (notification.type == NotificationType.newMessage) {
      final chatId = notification.payload?['chat_id'] as String?;
      if (chatId != null) context.push('/chats/$chatId');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final notifications = ref.watch(notificationsStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        actions: [
          TextButton(
            onPressed: () => markAllNotificationsAsRead(ref),
            child: Text(l10n.notificationsMarkAllRead),
          ),
        ],
      ),
      body: notifications.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.notificationsEmpty, icon: Icons.notifications_none);
          }
          return ListView.separated(
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final notification = items[index];
              return ListTile(
                leading: CircleAvatar(child: Icon(_iconForType(notification.type))),
                title: Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: notification.isRead ? FontWeight.normal : FontWeight.w700,
                  ),
                ),
                subtitle: notification.body != null ? Text(notification.body!) : null,
                trailing: notification.isRead
                    ? null
                    : Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                onTap: () => _onTap(context, ref, notification),
              );
            },
          );
        },
      ),
    );
  }
}
