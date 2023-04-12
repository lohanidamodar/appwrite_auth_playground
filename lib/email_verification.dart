import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/form_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmailVerification extends StatefulWidget {
  final Account account;

  const EmailVerification({super.key, required this.account});
  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: FormView(
        buttonLabel: "Send Email",
        onSubmit: (email, {password, confirmPassword, name}) async {
          await widget.account.createVerification(
            url: 'appwrite-callback-auth-authplayground://popupbits.com/verify',
          );
          print('email sent');
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
