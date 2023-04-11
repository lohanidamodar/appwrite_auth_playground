import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/confirm_login.dart';
import 'package:appwrite_auth_playground/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      print(state.queryParams);
      return const MyHomePage(title: 'Appwrite Authentication playground');
    },
    routes: [
      GoRoute(path: 'magic-url', builder: (context, state) {
        return ConfirmLogin(
          userId: state.queryParams['userId'] ?? '',
          secret: state.queryParams['secret'] ?? '',
          account: account,
        );
      },),
      GoRoute(
          path: 'login',
          builder: (context, state) {
            return LoginPageMagic(account: account);
          })
    ],
  )
]);

final client = Client(
        endPoint:
            'https://8080-appwrite-appwrite-kd0bv2jqtjq.ws-us93.gitpod.io/v1')
    .setProject('authplayground');
final account = Account(client);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(children: [
        ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            context.go('/login');
          },
        )
      ]),
    );
  }
}
