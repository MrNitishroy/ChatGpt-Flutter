import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Config/Colors.dart';

class ChatComp extends StatelessWidget {
  final String message;
  final String role;
  const ChatComp({super.key, required this.message, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: role == "user"
                ? Image.asset(
                    "Assets/pic/pic.png",
                    width: 30,
                  )
                : SvgPicture.asset(
                    "Assets/pic/chatgpt.svg",
                    width: 25,
                  ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: divColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Flexible(
                child: Text(message),
              ),
            ),
          )
        ],
      ),
    );
  }
}
