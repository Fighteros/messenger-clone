import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_mini_clone/shared/bloc_observer.dart';

import 'layout/home_layout.dart';
import 'modules/chats/chats.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => ChatsScreen()
      },
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
