import 'package:chat_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 追加

class Message {
  final String id;
  final String content;
  final DateTime timestamp;
  final User sender;

  Message(
      {required this.id,
      required this.content,
      required this.timestamp,
      required this.sender});

  Message.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        content = map['content'],
        timestamp = (map['timestamp'] as Timestamp).toDate(),
        sender = User.fromMap(map['sender']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp,
      'sender': sender.toMap(),
    };
  }
}
