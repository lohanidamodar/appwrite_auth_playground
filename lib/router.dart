import 'package:appwrite/appwrite.dart';
import 'package:appwrite_auth_playground/recover.dart';
import 'package:appwrite_auth_playground/register.dart';
import 'package:go_router/go_router.dart';

import 'confirm_login.dart';
import 'forgot_password.dart';
import 'home.dart';
import 'login.dart';

final client = Client(endPoint: 'http://dlauthplay.appwrite.org/v1')
    .setProject('authplayground');
final account = Account(client);

final router = GoRouter(debugLogDiagnostics: true, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomePage(title: 'Appwrite Authentication playground');
    },
    routes: [
      GoRoute(
        path: 'magic-url',
        builder: (context, state) {
          return ConfirmLogin(
            userId: state.queryParams['userId'] ?? '',
            secret: state.queryParams['secret'] ?? '',
            account: account,
          );
        },
      ),
      GoRoute(
        path: 'recovery',
        builder: (context, state) {
          print(state.queryParams);
          return RecoverPassword(
            account: account,
            userId: state.queryParams['userId'] ?? '',
            secret: state.queryParams['secret'] ?? '',
          );
        },
      ),
      GoRoute(
        path: 'login',
        builder: (context, state) {
          return LoginPageMagic(account: account);
        },
      ),
      GoRoute(
        path: 'register',
        builder: (context, state) {
          return Register(account: account);
        },
      ),
      GoRoute(
        path: 'forgot-password',
        builder: (context, state) {
          return ForgotPassword(account: account);
        },
      ),
    ],
  )
]);
