import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  final Account account;

  const LoginPage({super.key, required this.account});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: FormView(
        buttonLabel: "Login",
        showPassword: true,
        onSubmit: (email, {password, confirmPassword, name}) async {
          await widget.account
              .createEmailSession(email: email, password: password!);
          print("login success ");
          return true;
        },
        children: [
          TextButton(
              onPressed: () {
                context.go('/register');
              },
              child: Text("Register"))
        ],
      ),
    );
  }
}
