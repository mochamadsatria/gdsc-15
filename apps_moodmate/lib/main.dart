import 'package:flutter/material.dart';
import 'package:flutterapp/mdmtapp/generatedchatwidget/GeneratedChatWidget.dart';
import 'package:flutterapp/mdmtapp/generatedhomepagewidget/GeneratedHomepageWidget.dart';
import 'package:flutterapp/mdmtapp/generatedregisterstep1widget/GeneratedRegisterStep1Widget.dart';
import 'package:flutterapp/mdmtapp/generatedloginwidget/GeneratedLoginWidget.dart';
import 'package:flutterapp/mdmtapp/generatedwaitingchatwidget/GeneratedWaitingchatWidget.dart';
import 'package:flutterapp/mdmtapp/generated1widget/Generated1Widget.dart';
import 'package:flutterapp/mdmtapp/generatedhappywidget2/GeneratedHappyWidget2.dart';
import 'package:flutterapp/mdmtapp/generatedangrywidget1/GeneratedAngryWidget1.dart';
import 'package:flutterapp/mdmtapp/generatedsadwidget2/GeneratedSadWidget2.dart';
import 'package:flutterapp/mdmtapp/generatedcalmwidget2/GeneratedCalmWidget2.dart';
import 'package:flutterapp/mdmtapp/generatedcoolwidget2/GeneratedCoolWidget2.dart';
import 'package:flutterapp/mdmtapp/generatedregisterstep2widget/GeneratedRegisterStep2Widget.dart';
import 'package:flutterapp/mdmtapp/generatedpetwidget1/GeneratedPetWidget1.dart';
import 'package:flutterapp/mdmtapp/generatedminigamestictactoewidget/GeneratedMinigamesTicTacToeWidget.dart';
import 'package:flutterapp/mdmtapp/generatedassetwidget/GeneratedAssetWidget.dart';
import 'package:flutterapp/mdmtapp/generatedframe1widget/GeneratedFrame1Widget.dart';
import 'package:flutterapp/mdmtapp/generatedimage1widget/GeneratedImage1Widget.dart';
import 'package:flutterapp/mdmtapp/generatedchatuiwidget/GeneratedChatUIWidget.dart';

void main() {
  runApp(mdmtApp());
}

class mdmtApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/Generated1Widget',
      routes: {
        '/GeneratedChatWidget': (context) => GeneratedChatWidget(),
        '/GeneratedHomepageWidget': (context) => GeneratedHomepageWidget(),
        '/GeneratedRegisterStep1Widget': (context) =>
            GeneratedRegisterStep1Widget(),
        '/GeneratedLoginWidget': (context) => GeneratedLoginWidget(),
        '/GeneratedWaitingchatWidget': (context) =>
            GeneratedWaitingchatWidget(),
        '/Generated1Widget': (context) => Generated1Widget(),
        '/GeneratedHappyWidget2': (context) => GeneratedHappyWidget2(),
        '/GeneratedAngryWidget1': (context) => GeneratedAngryWidget1(),
        '/GeneratedSadWidget2': (context) => GeneratedSadWidget2(),
        '/GeneratedCalmWidget2': (context) => GeneratedCalmWidget2(),
        '/GeneratedCoolWidget2': (context) => GeneratedCoolWidget2(),
        '/GeneratedRegisterStep2Widget': (context) =>
            GeneratedRegisterStep2Widget(),
        '/GeneratedPetWidget1': (context) => GeneratedPetWidget1(),
        '/GeneratedMinigamesTicTacToeWidget': (context) =>
            GeneratedMinigamesTicTacToeWidget(),
        '/GeneratedAssetWidget': (context) => GeneratedAssetWidget(),
        '/GeneratedFrame1Widget': (context) => GeneratedFrame1Widget(),
        '/GeneratedImage1Widget': (context) => GeneratedImage1Widget(),
        '/GeneratedChatUIWidget': (context) => GeneratedChatUIWidget(),
      },
    );
  }
}
