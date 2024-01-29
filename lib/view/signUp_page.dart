// ignore: file_names
import 'package:fashion/util/components.dart';
import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 50, right: 18, left: 18, bottom: 20),
              child: const Column(
                children: [
                  Text(
                    'Create Account',
                    style: kTitleStyle,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fill your information bellow or register with yout social account',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            DefaultField(
                controller: nameController,
                name: 'Name',
                isPassword: false,
                hintText: 'Your Name'),
            DefaultField(
                controller: emailController,
                name: 'E-mail',
                isPassword: false,
                hintText: 'example@email.com'),
            DefaultField(
                controller: passwordController,
                name: 'Password',
                isPassword: true,
                hintText: '****************'),
            termsAndConditions(),
            const DefaultButton(name: 'Sign Up'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Get sign up with',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
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
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      'Sign In',
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

  Padding termsAndConditions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return Colors.transparent;
              }
              return Colors.black;
            }),
            side: const BorderSide(
              color: Colors.black,
              width: 2,
            ),
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Row(
            children: [
              const Text(
                'Agree with ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  _showModal(context);
                },
                child: const Text(
                  'Terms & Condition',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terms & Conditions'),
          content: const Text(
              'Here the terms and conditions of the store would be written.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
