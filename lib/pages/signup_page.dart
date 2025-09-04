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
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String? _emailInput;
  String? _firstPasswordInput;
  String? _confirmPasswordInput;

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
              children: [
                _titleWidget(),
                _registerFormWidget(),
                _registeButton(),
                _loginTextLink(),
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
      height: _heightDevice! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textEmailFormField(),
            _textPasswordFormField(),
            _confirmPasswordFormField(),
          ],
        ),
      ),
    );
  }

  Widget _textEmailFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _emailInput = value;
        });
      },
      decoration: InputDecoration(hintText: "Email"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        bool results = value!.contains(
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$'),
        );
        if (!results) {
          return "Please enter a valid email address";
        }
        return null;
      },
    );
  }

  Widget _textPasswordFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _firstPasswordInput = value;
        });
      },
      decoration: InputDecoration(hintText: "Password"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) => value!.length > 6
          ? null
          : "Please enter password greater than 6 character",
    );
  }

  Widget _confirmPasswordFormField() {
    return TextFormField(
      onSaved: (value) {
        setState(() {
          _confirmPasswordInput = value;
        });
      },
      decoration: InputDecoration(hintText: "Confirm Password"),
      keyboardType: TextInputType.emailAddress,
      validator: (value) =>
          value! == _firstPasswordInput ? null : "Password does not match",
    );
  }

  _registeButton() {
    return MaterialButton(
      onPressed: () {
        if (_registerFormKey.currentState!.validate()) {
          _registerFormKey.currentState!.save();
        }
      },
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

  Widget _loginTextLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'login'),
      child: Text(
        "Have an account? login",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 14,
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
