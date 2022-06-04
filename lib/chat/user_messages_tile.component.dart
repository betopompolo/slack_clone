import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'message.dart';

class UserMessagesTile extends ConsumerWidget {
  const UserMessagesTile({required this.userMessages, Key? key})
      : super(key: key);

  final List<Message> userMessages;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (userMessages.isEmpty) {
      return const SizedBox.shrink();
    }

    final user = userMessages.first.emitter;
    final sortedMessages = ref.read(sortMessagesProvider(userMessages));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox.square(
            dimension: 40,
            child: Image.network(user.imageUrl),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _toTime(sortedMessages.last.sentAt),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                );
              }
              final message = userMessages[index - 1];
              return Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemCount: userMessages.length + 1,
          ),
        ),
      ],
    );
  }

  String _toTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat('jm');
    return formatter.format(dateTime);
  }
}

final sortMessagesProvider = Provider.family<List<Message>, List<Message>>(
  (ref, messages) {
    return messages.sortedBy((message) => message.sentAt);
  },
);
