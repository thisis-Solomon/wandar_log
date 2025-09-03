import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() {
    return _SignUpPageState();
  }
}

class _SignUpPageState extends State<SignUpPage> {
  double? _widthDevice, _heightDevice;
  @override
  Widget build(BuildContext context) {
    _widthDevice = MediaQuery.of(context).size.width;
    _heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: _widthDevice! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _registerFormWidget(),
                _registeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _titleWidget() {
    return Text(
      "Wonder Log",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  _registerFormWidget() {
    return SizedBox(
      height: _heightDevice! * 0.20,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }

  _registeButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _widthDevice! * 0.80,
      height: _heightDevice! * 0.07,
      color: Colors.blueGrey[900],
      child: Text(
        "Register",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.blueGrey[50],
          letterSpacing: 1,
        ),
      ),
    );
  }
}
