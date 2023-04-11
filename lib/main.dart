import 'package:chat_app/providers/authentication_provider.dart';
import 'package:chat_app/providers/chat_room_provider.dart';
import 'package:chat_app/screens/chat_room_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatRoomProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<AuthenticationProvider>(
          builder: (context, authProvider, _) {
            if (authProvider.user != null) {
              return ChatRoomScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
