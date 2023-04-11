import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  final bool showEmail;
  final bool showPassword;
  final bool showConfirmPassword;

  final Function(String email, {String? password, String? confirmPassword})
      onSubmit;
  const FormView({
    Key? key,
    this.showEmail = true,
    this.showPassword = false,
    this.showConfirmPassword = false,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (widget.showEmail)
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'enter email'),
          ),
        if (widget.showPassword) ...[
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'enter password'),
          ),
        ],
        if (widget.showConfirmPassword) ...[
          const SizedBox(height: 10.0),
          TextField(
            obscureText: true,
            controller: _confirmPasswordController,
            decoration: const InputDecoration(hintText: 'confirm password'),
          ),
        ],
        const SizedBox(height: 20.0),
        ElevatedButton(
          child: const Text('Login'),
          onPressed: () => widget.onSubmit(_emailController.text, password: _passwordController.text, confirmPassword: _confirmPasswordController.text),
        )
      ],
    );
  }
}
