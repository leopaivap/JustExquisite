import 'package:fashion/view/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const JustExquisite());
}

class JustExquisite extends StatelessWidget {
  const JustExquisite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
      },
    );
  }
}