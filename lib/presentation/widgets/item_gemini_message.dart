import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:gemini_bloc/date/models/message_model.dart';
import 'package:gemini_bloc/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:gemini_bloc/presentation/pages/web_view_page.dart';


Widget itemOfGeminiMessage(MessageModel message, HomeBloc bloc, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 24,
            child: Image.asset('assets/images/gemini_icon.png'),
          ),
          GestureDetector(
            onTap: () {
              //controller.speak(message.message);
              bloc.speak(message.message);
            },
            child:  const Icon(
              color: Colors.grey,
              Icons.volume_up,
              //color: controller.speakerColor ,
            ),
          )
        ]),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 16),
          child: Linkify(
            onOpen: (link) {
              Navigator.of(context).push( MaterialPageRoute(builder: (BuildContext context){
                return WebViewPage(url: link.url);
              }));
            },
            text: message.message!,
            style: const TextStyle(
                color: Color.fromRGBO(173, 173, 176, 1), fontSize: 16),
          ),),
      ],
    ),
  );
}