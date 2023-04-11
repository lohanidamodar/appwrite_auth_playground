import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:appwrite_auth_playground/login.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  final Account account;

  const ForgotPassword({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: FormView(
        onSubmit: (email, {password, confirmPassword}) async {
          await account.createRecovery(
            email: email,
            url:
                'appwrite-callback-auth-authplayground://popupbits.com/recovery',
          );
          print('email sent');
        },
      ),
    );
  }
}
