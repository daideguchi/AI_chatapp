import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/models/message.dart';

class ChatRoomProvider with ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  final _messagesCollection = 'messages';
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  ChatRoomProvider() {
    _loadMessages();
  }

  void _loadMessages() {
    _firestore
        .collection(_messagesCollection)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _messages =
          snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
      notifyListeners();
    });
  }

  void addMessage(Message message) {
    _firestore.collection(_messagesCollection).add(message.toMap());
    _messages.add(message);
    notifyListeners();
  }
}
