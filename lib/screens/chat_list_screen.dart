import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: 10, // 仮のデータ数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Chat $index'),
            onTap: () {
              // チャットルームへの遷移処理
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/select_chat_partner');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
