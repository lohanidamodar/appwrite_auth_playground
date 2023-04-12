import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        ElevatedButton(
          child: const Text('Magic URL Login'),
          onPressed: () {
            context.go('/login');
          },
        ),
        ElevatedButton(
          child: const Text('Forogt Password'),
          onPressed: () {
            context.go('/forgot-password');
          },
        ),
      ]),
    );
  }
}
