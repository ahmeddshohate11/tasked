import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Text('Welcome to the Chat Screen!'),
      ),
    );
  }
}