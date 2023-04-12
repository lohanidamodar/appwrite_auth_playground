import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/models.dart' as models;

class VerifyEmail extends StatefulWidget {
  final String userId;
  final String secret;
  final Account account;

  const VerifyEmail(
      {super.key,
      required this.userId,
      required this.secret,
      required this.account});
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  models.Account? account;
  @override
  void initState() {
    super.initState();
    _confirmLogin();
  }

  void _confirmLogin() async {
    await widget.account.updateVerification(
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
            const Text("Verified"),
            Text(account!.email),
          ]
        ],
      ),
    );
  }
}
