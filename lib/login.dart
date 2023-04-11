import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:flutter/material.dart';

class LoginPageMagic extends StatefulWidget {
  final Account account;

  const LoginPageMagic({super.key, required this.account});
  @override
  State<LoginPageMagic> createState() => _LoginPageMagicState();
}

class _LoginPageMagicState extends State<LoginPageMagic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: FormView(
        onSubmit: (email, {password, confirmPassword}) async {
          await widget.account.createMagicURLSession(
            userId: ID.unique(),
            email: email,
          );
          print('email sent');
        },
      ),
    );
  }
}
