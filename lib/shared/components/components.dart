import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// get default Login Btn
Widget getDefaultButton({
  required String titleText,
  Color? color = Colors.blue,
  VoidCallback? onPressed,
  Color fontColor = Colors.white,
  FontWeight fontWeight = FontWeight.bold,
  double fontSize = 13.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 40.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          titleText,
          style: TextStyle(
              color: fontColor, fontWeight: fontWeight, fontSize: fontSize),
        ),
      ),
    );

// get default TextForm Field
Widget getDefaultTextFormField({
  required TextEditingController controller,
  required String hintText,
  required Function(String? val) validator,
  Function(dynamic val)? onChanged,
  TextInputType? keyboardType,
  bool obscureText = false,
  bool isCollapsed = false,
}) =>
    TextFormField(
      validator: (value) => validator(value),
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: isCollapsed
          ? InputDecoration.collapsed(hintText: hintText)
          : InputDecoration(
              hintText: hintText,
            ),
    );
