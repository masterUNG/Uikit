import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen03 extends StatefulWidget {
  SignUpScreen03({Key? key}) : super(key: key);

  @override
  _SignUpScreen03State createState() => _SignUpScreen03State();
}

class _SignUpScreen03State extends State<SignUpScreen03> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.dark, //navigation bar icons' color
      ),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Spacer(),
                      titleHead(),
                      subTitleHead(),
                      SizedBox(height: 64.0),
                      buildEmail(constraints),
                      resetButton(constraints),
                      Spacer(),
                      signUpButton(),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container signUpButton() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: GestureDetector(
        child: Text("Don't have an account ? Signup"),
        onTap: () {
          // place signup function here
        },
      ),
    );
  }

  Container resetButton(BoxConstraints constraints) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
              (constraints.maxWidth > 412)
                  ? ((constraints.maxWidth * 0.5))
                  : (constraints.maxWidth),
              50),
        ),
        child: Text("Reset Password"),
        onPressed: () {
          // place sign in function here
        },
      ),
    );
  }

  Container buildEmail(BoxConstraints constraints) {
    return Container(
      width: (constraints.maxWidth > 412)
          ? ((constraints.maxWidth * 0.5))
          : (constraints.maxWidth),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0)),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Email',
        ),
      ),
    );
  }

  Container subTitleHead() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Text("Please enter your Email"),
    );
  }

  Container titleHead() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: Text(
        "Forgot Password?",
        style: TextStyle(fontSize: 32.0),
      ),
    );
  }
}
