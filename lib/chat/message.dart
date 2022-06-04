import 'package:flutter/material.dart';

class Message {
  Message({
    required this.id,
    required this.emitter,
    required this.text,
    required this.sentAt,
  });

  final String id;
  final User emitter;
  final String text;
  final DateTime sentAt;
}

// TODO: Rename it? Delete it?
class ChatMessage {
  ChatMessage({
    required this.emitter,
    required this.messages,
  });

  final User emitter;
  final List<Message> messages;
}

class User {
  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final String id;
  final String name;
  final String imageUrl;

  // TODO: Add freezed
  @override
  bool operator ==(covariant User other) =>
      other.id == id && other.name == name && other.imageUrl == imageUrl;

  @override
  int get hashCode => hashList([id, name, imageUrl]);
}
