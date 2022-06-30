import 'package:flutter/material.dart';
import 'package:temp_mail/style/my_style.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  TextEditingController controller;

  PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          child: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Style.primaryColor,
          ),
        ),
      ),
    );
  }
}
