import 'package:fashion/util/components.dart';
import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'just exquisite',
            style: kAppBarTitle,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 18),
              child: const Column(children: [
                Text(
                  'Sign In',
                  style: kTitleStyle,
                ),
                SizedBox(height: 10),
                Text('Hi! Welcome back, you\'ve been missed')
              ]),
            ),
            DefaultField(
              controller: emailController,
              name: 'E-mail',
              isPassword: false,
              isEditable:true,
              hintText: 'example@email.com',
            ),
            DefaultField(
              controller: passwordController,
              name: 'Password',
              isPassword: true,
              isEditable:true,
              hintText: '****************',
            ),
            const ForgotPassword(),
            const DefaultButton(
              name: 'Sign In',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Get sign in with',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(icon: MdiIcons.apple),
                  RoundedButton(icon: MdiIcons.google),
                  RoundedButton(icon: MdiIcons.facebook),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signUp');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
          //TODO - parte de esqueci minha senha
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
