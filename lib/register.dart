import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatelessWidget {
  final Account account;

  const Register({super.key, required this.account});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: FormView(
        buttonLabel: "Register",
        showEmail: true,
        showPassword: true,
        showName: true,
        onSubmit: (email, {password, confirmPassword, name}) async {
          await account.create(
            userId: ID.unique(),
            email: email,
            password: password!,
            name: name,
          );
          return true;
        },
        children: [
          TextButton(
              onPressed: () {
                context.go('/login');
              },
              child: Text("Already registered? Login"))
        ],
      ),
    );
  }
}
