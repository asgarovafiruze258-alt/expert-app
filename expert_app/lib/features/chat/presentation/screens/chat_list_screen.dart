import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/widgets/empty_state_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/chat_entity.dart';
import '../providers/chat_providers.dart';

class ChatListScreen extends ConsumerWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final chats = ref.watch(chatsListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.chatsTitle)),
      body: chats.when(
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : error.toString(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateView(message: l10n.chatsEmpty, icon: Icons.chat_bubble_outline);
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(chatsListProvider),
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, _) => const Divider(height: 1),
              itemBuilder: (context, index) => _ChatTile(chat: items[index]),
            ),
          );
        },
      ),
    );
  }
}

class _ChatTile extends StatelessWidget {
  final ChatEntity chat;

  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage:
            chat.otherUserAvatarUrl != null ? CachedNetworkImageProvider(chat.otherUserAvatarUrl!) : null,
        child: chat.otherUserAvatarUrl == null
            ? Text(chat.otherUserName.isNotEmpty ? chat.otherUserName[0].toUpperCase() : '?')
            : null,
      ),
      title: Text(chat.otherUserName),
      subtitle: Text(
        chat.lastMessageText ?? l10n.chatStartMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => context.push('/chats/${chat.id}', extra: chat.otherUserName),
    );
  }
}
