import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pair_lab/widgets/widgets.dart';
import 'package:pair_lab/utility/utility.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailTextFieldController = TextEditingController();
  var passwordTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            label: "Sign-up",
            onTap: signUpAuth,
          ),
        ],
      ),
    );
  }

  Future signUpAuth() async {
    try {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailTextFieldController.text,
        password: passwordTextFieldController.text,
      );
      AuthService().updateUserData(userCredential.user!);
    } finally {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
