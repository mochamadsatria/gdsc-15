import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreen();
}

class _ChatRoomScreen extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello World",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
