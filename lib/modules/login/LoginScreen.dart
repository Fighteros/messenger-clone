import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_mini_clone/shared/components/components.dart';
import 'package:messenger_mini_clone/shared/cubit/cubit.dart';
import 'package:messenger_mini_clone/shared/cubit/states.dart';

class LoginScreen extends StatelessWidget {
  var emailOrPhoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image(
                            image:
                                AssetImage('assets/images/messenger-ico.png')),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      // email or phone text Form Field
                      getDefaultTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this Field can\'t be empty';
                            }
                            return null;
                          },
                          controller: emailOrPhoneController,
                          hintText: "Phone Number or Email",
                          onChanged: (value) {
                            if (value!.isEmpty) {
                              cubit.isEmailEmpty = true;
                            } else {
                              cubit.isEmailEmpty = false;
                            }
                            cubit.validateLoginButton();
                          },
                          keyboardType: TextInputType.emailAddress),
                      SizedBox(
                        height: 15.0,
                      ),
                      getDefaultTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'this Field can\'t be empty';
                            }
                            return null;
                          },
                          controller: passwordController,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {
                            if (value!.isEmpty) {
                              cubit.isPasswordEmpty = true;
                            } else {
                              cubit.isPasswordEmpty = false;
                            }
                            cubit.validateLoginButton();
                          },
                          obscureText: true,
                          isCollapsed: true),
                      SizedBox(
                        height: 25.0,
                      ),
                      // to convert hex colors to it's value in flutter
                      // prefix it will 0xff
                      // here is the Login Button place
                      // login button
                      // if (isLoginBtnDisabled) inActiveLoginBtn else activeLoginBtn,
                      cubit.isLoginBtnDisabled
                          ? getDefaultButton(
                              titleText: 'LOG IN',
                              color: Colors.grey[300],
                            )
                          : getDefaultButton(titleText: 'LOG IN'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: getDefaultButton(
                          color: Colors.grey[200],
                          titleText: "CREATE NEW ACCOUNT",
                          fontWeight: FontWeight.bold,
                          onPressed: () {},
                          fontColor: Colors.black,
                        ),
                      ),
                      getDefaultButton(
                        titleText: "FORGET PASSWORD",
                        color: Colors.transparent,
                        fontColor: Colors.black,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
