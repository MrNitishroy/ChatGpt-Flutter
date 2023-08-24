import 'package:chatgpt1/Components/ChatComp.dart';
import 'package:chatgpt1/Components/TextField.dart';
import 'package:chatgpt1/Config/Colors.dart';
import 'package:chatgpt1/Controller/ChatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePahe extends StatelessWidget {
  const HomePahe({super.key});

  @override
  Widget build(BuildContext context) {
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "Assets/pic/pic.png",
                          width: 120,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          "This is a CHATGPT app where you can ask any question and get answer ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: lableColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: divColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              )),
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "Who is Flutter hero on Youtube ",
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: divColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              )),
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "Who is Flutter ",
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: divColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              )),
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "Who is Flutter hero on Youtube ",
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: divColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: borderColor,
                                width: 1,
                              )),
                          padding: EdgeInsets.all(10),
                          child: Center(
                              child: Text(
                            "Who is Flutter ",
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Obx(
                    () => Column(
                      children: chatController.chatData
                          .map(
                            (e) => ChatComp(
                              message: e.message.toString(),
                              role: e.role.toString(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            MyTextField(),
          ],
        ),
      ),
    );
  }
}
