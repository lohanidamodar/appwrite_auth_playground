import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:flutter/material.dart';

class RecoverPassword extends StatelessWidget {
  final Account account;
  final String userId;
  final String secret;

  const RecoverPassword(
      {super.key,
      required this.account,
      required this.userId,
      required this.secret});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recover Password'),
      ),
      body: FormView(
        buttonLabel: "Set Password",
        showPassword: true,
        showConfirmPassword: true,
        showEmail: false,
        onSubmit: (email, {confirmPassword, password, name}) async {
          await account.updateRecovery(
            userId: userId,
            secret: secret,
            password: password!,
            passwordAgain: confirmPassword!,
          );
          return true;
          print('password recovered');
        },
      ),
    );
  }
}
