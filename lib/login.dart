import 'package:appwrite/appwrite.dart';
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
      body: LoginView(
        type: LoginViewType.magicUrl,
        onLogin: (email) async {
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

enum LoginViewType { magicUrl, phone, emailPassword }

class LoginView extends StatefulWidget {
  final LoginViewType type;
  final Function(String) onLogin;
  const LoginView({Key? key, required this.type, required this.onLogin})
      : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (widget.type == LoginViewType.magicUrl ||
            widget.type == LoginViewType.emailPassword)
          TextField(
            controller: _emailController,
          ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          child: const Text('Login'),
          onPressed: () => widget.onLogin(_emailController.text),
        )
      ],
    );
  }
}
