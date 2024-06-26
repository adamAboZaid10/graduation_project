import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../../core/constant/color.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatUser user = ChatUser(id: '1', firstName: "khaled");
  ChatUser bot = ChatUser(id: '2', firstName: "bot");
  List<ChatMessage> allMessage = [];
  List<ChatUser> typing = [];
  String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyAIYHsQ07Y-Y_ot55qa0tgjI8EJVQ9co-k";

  final headers = {'Content-Type': 'application/json'};

  getData(ChatMessage m) async {
    typing.add(bot);
    allMessage.insert(0, m);
    setState(() {});
    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(url), headers: headers, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
            user: bot,
            createdAt: DateTime.now(),
            text: result['candidates'][0]['content']['parts'][0]['text']);
        setState(() {});
        allMessage.insert(0, m1);
        setState(() {});
      } else {
        print("Error Occured");
      }
    });
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueWhiteColor,
        centerTitle: true,
        title: Text(
          "Chat",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25.sp),
        ),
      ),
      body: DashChat(
        inputOptions: InputOptions(
          inputTextStyle: const TextStyle(color: Colors.black),
          autocorrect: true,
          inputDecoration: InputDecoration(
              hintText: "Enter a message",
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        typingUsers: typing,
        messageOptions: const MessageOptions(
            containerColor: Color.fromARGB(255, 231, 231, 231),
            textColor: Color.fromARGB(255, 0, 0, 0),
            showTime: true),
        currentUser: user,
        onSend: (ChatMessage message) {
          getData(message);
        },
        messages: allMessage,
      ),
    );
  }
}
