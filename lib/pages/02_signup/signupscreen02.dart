import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen02 extends StatefulWidget {
  SignUpScreen02({Key? key}) : super(key: key);

  @override
  _SignUpScreen02State createState() => _SignUpScreen02State();
}

class _SignUpScreen02State extends State<SignUpScreen02> {
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
              buildImage(constraints),
              groupTextFileAnButton(constraints)
            ],
          ),
        ),
      ),
    );
  }

  Center groupTextFileAnButton(BoxConstraints constraints) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: [
            Spacer(),
            buildEmail(constraints),
            SizedBox(height: 8.0),
            buildPassword(constraints),
            signInButton(constraints),
            signUpButton(),
            SizedBox(height: 16.0),
          ],
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

  Container signInButton(BoxConstraints constraints) {
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
        child: Text("Sign in"),
        onPressed: () {
          // place sign in function here
        },
      ),
    );
  }

  Container buildPassword(BoxConstraints constraints) {
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
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Password',
        ),
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
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Your Email',
        ),
      ),
    );
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: Image.asset(
        'assets/images/placeholder.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
