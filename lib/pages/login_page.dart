import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _widthDevice, _heightDevice;

  final GlobalKey _loginKey = GlobalKey<FormState>();

  String? _emailInput;
  String? _passwordInput;

  @override
  Widget build(BuildContext context) {
    _widthDevice = MediaQuery.of(context).size.width;
    _heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _widthDevice! * 0.05),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_titleWidget(), _loginForm(), _submitWidgetButton()],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "Wandar Log",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _loginForm() {
    return Container(
      height: _heightDevice! * 0.20,
      child: Form(
        key: _loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_textEmailField(), _passwordField()],
        ),
      ),
    );
  }

  Widget _textEmailField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _emailInput = value;
        });
      },
      validator: (value) {
        bool results = value!.contains(
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'),
        );
        if (!results) {
          return "Please enter a valid email address";
        }
        return null;
      },
      decoration: InputDecoration(hint: Text("Email")),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _passwordInput = value;
        });
      },
      validator: (value) => value!.length > 6
          ? null
          : "Please enter password greater than 6 character",
      decoration: InputDecoration(hint: Text("Password")),
    );
  }

  Widget _submitWidgetButton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _widthDevice! * 0.70,
      height: _heightDevice! * 0.07,
      color: Colors.blueGrey[900],
      child: Text(
        "Login",
        style: TextStyle(fontSize: 18, color: Colors.blueGrey[100]),
      ),
    );
  }
}
