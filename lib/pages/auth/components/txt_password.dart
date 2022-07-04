import 'package:flutter/material.dart';

/// This is the class where UI of SignIn is defined
class TxtPassword extends StatefulWidget {
  const TxtPassword({
    Key? key,
    required this.controller,
    this.hintText = "Password",
  }) : super(key: key);

  /// This is used to keep textfield value
  final TextEditingController controller;
  final String? hintText;

  @override
  State<TxtPassword> createState() => _TxtPasswordState();
}

class _TxtPasswordState extends State<TxtPassword> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              _isObscure = !_isObscure;
            }),
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          )),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return value != null && value.length < 6
            ? "Enter min. 6 characters"
            : null;
      },
    );
  }
}
