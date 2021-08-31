
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_mini_clone/shared/components/components.dart';

class LoginScreen extends StatelessWidget {

  var emailOrPhoneController = TextEditingController();
  var passwordController = TextEditingController();

  bool isLoginBtnDisabled = true;


  //@override
  /*void initState() {
    super.initState();
    activeLoginBtn = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.blue),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 40.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
        child: Text(
          "LOG IN",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.0),
        ),
      ),
    );
    inActiveLoginBtn = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), color: Colors.grey[300]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 40.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: null,
        child: Text(
          "LOG IN",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13.0),
        ),
      ),
    );
    setState(() {
      passwordController.addListener(() {
        isLoginBtnDisabled = ((emailOrPhoneController.text.isEmpty &&
            passwordController.text.isEmpty) ||
            (passwordController.text.isEmpty) ||
            (emailOrPhoneController.text.isEmpty))
            ? true
            : false;
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(
                    image: AssetImage(
                      'assets/images/messenger-ico.png'
                    )
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              getDefaultTextFormField(
                controller: emailOrPhoneController,
                hintText:  "Phone Number or Email",
                onChanged: (value){} ,
                keyboardType: TextInputType.emailAddress
              ),
              SizedBox(
                height: 15.0,
              ),
              getDefaultTextFormField(
                controller: passwordController ,
                hintText:  "Password",
                keyboardType:TextInputType.visiblePassword,
                onChanged: (value) {},
                obscureText: true,
                isCollapsed: true
              ),
              SizedBox(
                height: 25.0,
              ),
              // to convert hex colors to it's value in flutter
              // prefix it will 0xff
              // here is the Login Button place
              // login button
              // if (isLoginBtnDisabled) inActiveLoginBtn else activeLoginBtn,
              isLoginBtnDisabled?  getDefaultButton(
                titleText: 'LOG IN',
                color: Colors.grey[300],
              ): getDefaultButton(
                titleText: 'LOG IN'
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0
                ),
                child: getDefaultButton(
                  color: Colors.grey[200],
                  titleText: "CREATE NEW ACCOUNT",
                  fontWeight: FontWeight.bold,
                  onPressed: () {},
                  fontColor: Colors.black,
                ),
              ),
              getDefaultButton(
                  titleText:  "FORGET PASSWORD",
                color:  Colors.transparent,
                fontColor: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
