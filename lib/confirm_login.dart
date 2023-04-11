import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as models;

class ConfirmLogin extends StatefulWidget {
  final String userId;
  final String secret;
  final Account account;

  const ConfirmLogin(
      {super.key,
      required this.userId,
      required this.secret,
      required this.account});
  @override
  State<ConfirmLogin> createState() => _ConfirmLoginState();
}

class _ConfirmLoginState extends State<ConfirmLogin> {
  models.Account? account;
  @override
  void initState() {
    super.initState();
    _confirmLogin();
  }

  void _confirmLogin() async {
    await widget.account.updateMagicURLSession(
      userId: widget.userId,
      secret: widget.secret,
    );
    account = await widget.account.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          if (account == null) ...[
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
          if (account != null) ...[
            Text(account!.email),
          ]
        ],
      ),
    );
  }
}
