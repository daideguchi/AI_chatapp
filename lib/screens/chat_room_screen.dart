import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/providers/chat_room_provider.dart';
import 'package:chat_app/models/message.dart';

class ChatRoomScreen extends StatelessWidget {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);
    final chatRoomProvider = Provider.of<ChatRoomProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authProvider.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatRoomProvider.messages.length,
              itemBuilder: (context, index) {
                final message =
                    chatRoomProvider.messages.reversed.toList()[index]; // ここを修正
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: message.sender.imageUrl != null
                        ? NetworkImage(message.sender.imageUrl!)
                            as ImageProvider<Object>?
                        : AssetImage('assets/images/default_profile.png')
                            as ImageProvider<Object>?,
                  ),
                  title: Text(message.content),
                  subtitle: Text(
                      '${message.sender.name} - ${message.timestamp.toString()}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Send a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      final sender = authProvider.user!;
                      chatRoomProvider.addMessage(
                        Message(
                          id: DateTime.now().toString(),
                          content: _messageController.text,
                          timestamp: DateTime.now(),
                          sender: sender,
                        ),
                      );
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
