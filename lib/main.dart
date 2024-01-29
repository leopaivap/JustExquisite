import 'package:fashion/view/login_page.dart';
import 'package:fashion/view/signUp_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const JustExquisite());
}

class JustExquisite extends StatelessWidget {
  const JustExquisite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signUp',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUp(),
      },
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
