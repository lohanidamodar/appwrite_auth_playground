import 'package:flutter/material.dart';

typedef OnFormSubmit = Future<bool> Function(String email,
    {String? name, String? password, String? confirmPassword});

class FormView extends StatefulWidget {
  final bool showEmail;
  final bool showPassword;
  final bool showConfirmPassword;
  final String buttonLabel;
  final bool showName;
  final List<Widget>? children;

  final OnFormSubmit onSubmit;
  const FormView({
    Key? key,
    required this.onSubmit,
    required this.buttonLabel,
    this.showEmail = true,
    this.showPassword = false,
    this.showConfirmPassword = false,
    this.showName = false,
    this.children,
  }) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (widget.showName) ...[
          TextField(
            keyboardType: TextInputType.name,
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'enter name'),
          )
        ],
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
          child: Text(widget.buttonLabel),
          onPressed: () async {
            await widget.onSubmit(
              _emailController.text,
              password: _passwordController.text,
              confirmPassword: _confirmPasswordController.text,
              name: _nameController.text,
            );
            _passwordController.clear();
            _confirmPasswordController.clear();
            _nameController.clear();
            _emailController.clear();
          },
        ),
        if (widget.children != null) ...[
          const SizedBox(height: 10.0),
          ...widget.children!,
        ]
      ],
    );
  }
}
