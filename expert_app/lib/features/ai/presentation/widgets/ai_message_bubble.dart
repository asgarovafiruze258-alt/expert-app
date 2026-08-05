import 'package:flutter/material.dart';

import '../../domain/entities/ai_chat_message_entity.dart';

class AiMessageBubble extends StatelessWidget {
  final AiChatMessageEntity message;

  const AiMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUser = message.role == AiMessageRole.user;
    final bubbleColor = isUser ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest;
    final textColor = isUser ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.78),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(message.content, style: TextStyle(color: textColor)),
      ),
    );
  }
}
