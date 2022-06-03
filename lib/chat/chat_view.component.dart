import 'package:flutter/material.dart';

import 'message.dart';

class ChatView extends StatelessWidget {
  const ChatView({required this.messages, Key? key}) : super(key: key);

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Text('${messages.length} messages'),
    );
  }
}

final mockedEmitter = User(
  id: "user1",
  name: "Beto",
  imageUrl: "https://ca.slack-edge.com/T0342JUTV-UAKNHTD8V-a3caad65e4fa-512",
);
final List<Message> mockedMessages = [
  Message(
    id: "1",
    emitter: mockedEmitter,
    text: "Olá!",
  ),
  Message(
    id: "2",
    emitter: mockedEmitter,
    text: "Tudo bem?",
  ),
  Message(
    id: "3",
    emitter: mockedEmitter,
    text: "Teste 2",
  ),
];
