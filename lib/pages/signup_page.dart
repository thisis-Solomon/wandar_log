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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                _registerButton(),
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
          RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
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
      controller: _passwordController,
      decoration: InputDecoration(hintText: "Password"),
      obscureText: true,
      validator: (value) => value != null && value.length >= 6
          ? null
          : "Password must be at least 6 characters",
    );
  }

  Widget _confirmPasswordFormField() {
    return TextFormField(
      controller: _confirmPasswordController,
      decoration: InputDecoration(hintText: "Confirm Password"),
      obscureText: true,
      validator: (value) =>
          value == _passwordController.text ? null : "Passwords do not match",
    );
  }

  _registerButton() {
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
