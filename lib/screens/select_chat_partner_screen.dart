import 'package:flutter/material.dart';

class SelectChatPartnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Chat Partner'),
      ),
      body: ListView.builder(
        itemCount: 10, // 仮のデータ数
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Character $index'),
            onTap: () {
              Navigator.pushNamed(context, '/chat_room');
            },
          );
        },
      ),
    );
  }
}
