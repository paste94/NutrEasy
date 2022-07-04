import 'package:bloc_auth/pages/auth/SignIn/sign_in_view.dart';
import 'package:bloc_auth/pages/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/pages/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This is the class where you can choose whether to show signin or dashboard.
/// It wraps the sign in view in order to separate logit from view
class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            print("STATE UNAUTHENTICATED");
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Dashboard()));
          }
          if (state is AuthError) {
            print("STATE ERROR");

            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return const SignInView();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
