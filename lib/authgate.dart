import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:yo_sugars/index.dart';

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            showAuthActionSwitch: true,
            headerBuilder: (context, constraints, _) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/login.jpg"),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  action == AuthAction.signIn
                      ? 'Welcome to the YoSugars! Please sign in to continue.'
                      : 'Welcome to YoSugars! Please create an account to continue',
                ),
              );
            },
            //footer
            footerBuilder: (context, _) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions of our services.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            providerConfigs: const [
              EmailProviderConfiguration(),
              // GoogleProviderConfiguration(
              //   clientId: '...',
              // ),
            ],
          );
        }
        return Index();
      },
    );
  }
}
