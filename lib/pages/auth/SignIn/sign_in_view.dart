import 'package:bloc_auth/assets/auth_constants_size.dart';
import 'package:bloc_auth/assets/common_constants.dart';
import 'package:bloc_auth/pages/auth/SignUp/sign_up.dart';
import 'package:bloc_auth/pages/auth/auth_const.dart';
import 'package:bloc_auth/pages/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/pages/auth/components/facebook_button.dart';
import 'package:bloc_auth/pages/auth/components/google_button.dart';
import 'package:bloc_auth/pages/auth/components/txt_email.dart';
import 'package:bloc_auth/pages/auth/components/txt_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is the class where UI of SignIn is defined
class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
        padding: const EdgeInsets.all(pagePadding),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Sign In",
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
                      TxtPassword(
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: authSeparatorHeight / 4,
                      ),
                      InkWell(
                        child: Container(
                            alignment: Alignment.topRight,
                            child: const Text(
                              'Lost your password?',
                            )),
                        onTap: () {/* TODO */},
                      ),
                      const SizedBox(
                        height: authSeparatorHeight,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            _authenticateWithEmailAndPassword(context);
                          },
                          child: const Text(
                            'Sign In',
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
              const Text(
                'OR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: authSeparatorHeight,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
                GoogleButton(),
                FacebookButton(),
              ]),
              const SizedBox(
                height: authSeparatorHeight,
              ),
              const Divider(),
              const SizedBox(
                height: authSeparatorHeight,
              ),
              const Text("Don't have an account?"),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: const Text("Sign Up"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }
}
