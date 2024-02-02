import 'package:fashion/view/home_page.dart';
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
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signUp': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
      },
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
          bodySmall: const TextStyle(color: Colors.black), 
        ),
      ),
    );
  }
}
