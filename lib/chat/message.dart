class Message {
  Message({
    required this.id,
    required this.emitter,
    required this.text,
  });

  final String id;
  final User emitter;
  final String text;
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
}
