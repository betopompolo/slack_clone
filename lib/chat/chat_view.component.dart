import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slack_clone/shared/widgets/widgets.dart';

import 'group_chat_messages.provider.dart';
import 'message.dart';
import 'user_messages_tile.component.dart';

class ChatView extends ConsumerWidget {
  const ChatView({required this.messages, Key? key}) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatMessages = ref.read(groupChatMessagesProvider(messages));

    return ListView.builder(
      itemBuilder: (context, index) {
        final chatMessage = chatMessages[index];

        return MouseHoverBuilder(builder: (context, isMouseOver) {
          return HighlightContainer(
            isHighlighted: isMouseOver,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserMessagesTile(
                userMessages: chatMessage.messages,
              ),
            ),
          );
        });
      },
      itemCount: chatMessages.length,
    );
  }
}
