import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

import 'message.dart';

// TODO: Improve this provider's name (and rename test file)
final groupChatMessagesProvider =
    Provider.family<List<ChatMessage>, List<Message>>(
  (ref, messages) {
    final List<ChatMessage> chatMessages = [];

    for (final message in messages) {
      final lastChatMessage = chatMessages.lastOrNull;
      if (message.emitter == lastChatMessage?.emitter) {
        chatMessages.last.messages.add(message);
      } else {
        chatMessages.add(
          ChatMessage(emitter: message.emitter, messages: [message]),
        );
      }
    }

    return chatMessages;
  },
);
