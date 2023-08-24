import 'package:chatgpt1/Config/Colors.dart';
import 'package:chatgpt1/Controller/ChatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return TextFormField(
      controller: chatController.messageController,
      decoration: InputDecoration(
        fillColor: divColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: "Have you any Question",
        suffix: Obx(
          () => chatController.isLoading.value
              ? Lottie.asset('Assets/Animation/loading.json',
                  width: 40, height: 20)
              : InkWell(
                  onTap: () {
                    chatController.sendMessage();
                  },
                  child: Image.asset("Assets/pic/send.png"),
                ),
        ),
      ),
    );
  }
}
