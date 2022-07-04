import 'package:bloc_auth/assets/auth_constants_size.dart';
import 'package:bloc_auth/pages/auth/SignIn/sign_in.dart';
import 'package:bloc_auth/pages/auth/auth_const.dart';
import 'package:bloc_auth/pages/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/pages/auth/components/google_button.dart';
import 'package:bloc_auth/pages/auth/components/txt_email.dart';
import 'package:bloc_auth/pages/auth/components/txt_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is the class where UI of SignIn is defined
class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordRepeatController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(authTitleSize),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: authTitleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: authSeparatorHeight * 2,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TxtEmail(controller: _emailController),
                      const SizedBox(
                        height: authSeparatorHeight / 2,
                      ),
                      TxtPassword(controller: _passwordController),
                      const SizedBox(
                        height: authSeparatorHeight / 2,
                      ),
                      TxtPassword(
                        controller: _passwordRepeatController,
                        hintText: "Repeat Password",
                      ),
                      const SizedBox(
                        height: authSeparatorHeight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            _createAccountWithEmailAndPassword(context);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: buttonTextFontSize,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: authSeparatorHeight,
              ),
              const Divider(),
              const SizedBox(
                height: authSeparatorHeight,
              ),
              const Text("Already have an account?"),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _passwordController.text,
        ),
      );
    }
  }
}
