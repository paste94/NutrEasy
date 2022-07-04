import 'package:bloc_auth/pages/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      color: Colors.grey,
      onPressed: () {
        //_authenticateWithGoogle(context);
      },
      icon: const Image(image: AssetImage('icons/facebook_icon.png')),
    );
  }
}
