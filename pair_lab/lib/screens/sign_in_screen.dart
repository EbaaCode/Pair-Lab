import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pair_lab/screens/sign_up_screen.dart';
import 'package:pair_lab/widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var emailTextFieldController = TextEditingController();
  var passwordTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultFormField(
            textHint: "E-mail",
            controller: emailTextFieldController,
          ),
          DefaultFormField(
            textHint: "Password",
            controller: passwordTextFieldController,
          ),
          DefaultButton(
            label: "Sign-in",
            onTap: signInAuth,
          ),
          DefaultButton(
            label: "Sign-up",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const SignUpScreen();
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future signInAuth() async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
    } finally {
      Navigator.pop(context);
    }
  }
}
