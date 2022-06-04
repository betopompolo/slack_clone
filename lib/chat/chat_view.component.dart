import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group_chat_messages.provider.dart';
import 'message.dart';
import 'user_messages_tile.component.dart';

class ChatView extends ConsumerWidget {
  const ChatView({required this.messages, Key? key}) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMessages = ref.read(groupChatMessagesProvider(messages));

    return ListView.separated(
      itemBuilder: (context, index) {
        final chatMessage = chatMessages[index];

        return UserMessagesTile(
          userMessages: chatMessage.messages,
        );
      },
      itemCount: chatMessages.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
