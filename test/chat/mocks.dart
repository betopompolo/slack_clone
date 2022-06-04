import 'package:slack_clone/chat/message.dart';

final mockUser1 = User(
  id: "user1",
  name: "Beto",
  imageUrl: "https://ca.slack-edge.com/T0342JUTV-UAKNHTD8V-a3caad65e4fa-512",
);

final mockUser2 = User(
  id: "user2",
  name: "Christiano",
  imageUrl: "https://ca.slack-edge.com/T0342JUTV-UB9J7SRDY-ade9bcea8acd-512",
);

final List<Message> mockedMessages = [
  Message(
    id: "message1",
    emitter: mockUser1,
    text: "Olá!",
    sentAt: DateTime.now().subtract(const Duration(seconds: 2)),
  ),
  Message(
    id: "message2",
    emitter: mockUser1,
    text: "Tudo bem?",
    sentAt: DateTime.now().subtract(const Duration(seconds: 1)),
  ),
  Message(
    id: "message3",
    emitter: mockUser2,
    text: "oi!",
    sentAt: DateTime.now(),
  ),
  Message(
    id: "message1235412",
    emitter: mockUser2,
    text: "tudo e vc?",
    sentAt: DateTime.now(),
  ),
  Message(
    id: "message4",
    emitter: mockUser1,
    text: "tudo bem tb",
    sentAt: DateTime.now(),
  ),
  Message(
    id: "message5",
    emitter: mockUser2,
    text: "😁",
    sentAt: DateTime.now(),
  ),
];
