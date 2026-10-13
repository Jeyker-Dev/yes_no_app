import "package:flutter/material.dart";

import "../../domain/entities/message.dart";

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola Mundo', fromWho: FromWho.me),
    Message(text: 'Esta todo bien?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

  }
}