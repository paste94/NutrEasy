import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

/// This is the class where UI of SignIn is defined
class TxtEmail extends StatefulWidget {
  const TxtEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  /// This is used to keep textfield value
  final TextEditingController controller;

  @override
  State<TxtEmail> createState() => _TxtEmailState();
}

class _TxtEmailState extends State<TxtEmail> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      decoration: const InputDecoration(
          hintText: "Email",
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return value != null && !EmailValidator.validate(value)
            ? 'Enter a valid email'
            : null;
      },
    );
  }
}
