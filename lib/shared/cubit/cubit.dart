import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_mini_clone/modules/chats/chats.dart';
import 'package:messenger_mini_clone/modules/login/LoginScreen.dart';
import 'package:messenger_mini_clone/modules/single_chat_screen/SingleChatScreen.dart';
import 'package:messenger_mini_clone/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  int currentIndex = 0;
  late Database database;

  late bool isEmailEmpty;
  late bool isPasswordEmpty;

  bool isLoginBtnDisabled = true;

  List<Widget> screens = [LoginScreen(), ChatsScreen(), SingleChatScreen()];

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void createDatabase() {
    openDatabase('messenger-db.db', version: 1, onCreate: (database, version) {
      print('Database Created Successfully!');
      database
          .execute(
              'CREATE TABLE users (id INTEGER PRIMARY KEY,first-name TEXT, last-name TEXT ,email TEXT, phone TEXT)')
          .then((value) => print('Table created!'))
          .onError((error, stackTrace) => print(error.toString()));
    }, onOpen: (database) {
      print('Database Opened!');
    }).then((value) {
      database = value;
      emit(AppCreateDateBaseState());
    }).onError((error, stackTrace) {
      if (error is FutureOr) {
        print(error.toString());
      }
    });
  }

  void getLoginScreen(int index) {
    currentIndex = index;
    emit(AppLoginState());
  }

  void validateLoginButton() {
    isLoginBtnDisabled = ((isEmailEmpty && isPasswordEmpty) ||
            (isEmailEmpty) ||
            (isPasswordEmpty))
        ? true
        : false;
    emit(AppLoginBtnValidateState());
  }
}
