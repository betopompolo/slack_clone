import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:slack_clone/chat/group_chat_messages.provider.dart';

import 'mocks.dart';

void main() {
  group('groupChatMessagesProvider Provider', () {
    test('Should group a list of messages by sentAt value', () {
      final ref = ProviderContainer();
      addTearDown(ref.dispose);

      final groupedMessages = ref.read(
        groupChatMessagesProvider(mockedMessages),
      );
      final emitterIds = groupedMessages.map(
        (chatMessage) => chatMessage.emitter.id,
      );
      final messages = groupedMessages.map(
        (chatMessage) => chatMessage.messages.map((message) => message.id),
      );

      expect(
        emitterIds,
        [mockUser1.id, mockUser2.id, mockUser1.id, mockUser2.id],
      );
      expect(messages, [
        [_messageIdFromIndex(0), _messageIdFromIndex(1)],
        [_messageIdFromIndex(2), _messageIdFromIndex(3)],
        [_messageIdFromIndex(4)],
        [_messageIdFromIndex(5)],
      ]);
    });
  });
}

String _messageIdFromIndex(int index) {
  return mockedMessages[index].id;
}
