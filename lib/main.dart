import 'package:bank_app/features/login/presentation/views/login_view.dart';
import 'package:bank_app/features/login/presentation/views/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
      ),
      home: const WelcomeView(),
    );
  }
}
