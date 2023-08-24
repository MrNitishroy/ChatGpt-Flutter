import 'dart:convert';

import 'package:chatgpt1/Config/PrivateData.dart';
import 'package:chatgpt1/Model/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final RxList<ChatModel> chatData = <ChatModel>[
    ChatModel(message: "Hello my name is Nitish kumar", role: "user"),
    ChatModel(
      message: "Nice to meet you nitish kumar how can i help you",
      role: "ai",
    ),
  ].obs;

  TextEditingController messageController = TextEditingController();

  String URL = "https://api.openai.com/v1/chat/completions";
  RxBool isLoading = false.obs;

  void sendMessage() async {
    isLoading.value = true;
    addMessage();
    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": messageController.text,
        }
      ],
      "max_tokens": 500,
    };

    Uri uri = Uri.parse(URL);

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $APIKEY",
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var res = data['choices'][0]['message']['content'];
      var newchat = ChatModel(message: res, role: "ai");
      chatData.add(newchat);
      print(res);
    } else {
      print("error");
    }
    messageController.clear();
    isLoading.value = false;
  }

  void addMessage() {
    var newchat = ChatModel(message: messageController.text, role: "user");
    chatData.add(newchat);
  }
}
