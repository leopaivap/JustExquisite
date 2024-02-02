import 'package:fashion/util/components.dart';
import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    return Column(

      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical:20, horizontal: 18),
          child: const Column(children: [
            Text(
              'Your Profile',
              style: kTitleStyle,
            ),
            SizedBox(height: 10),
            Text(
                'Don\'t worry, only you can see your personal\ndata. No one else will be able to see it.', textAlign: TextAlign.center,)
          ]),
        ),
         Container(
          padding: const EdgeInsets.all(18),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.shade300,
          ),
          child: Icon(Icons.person, color: Colors.grey.shade600, size:85,)),

        DefaultField(
            controller: nameController,
            name: 'Name',
            isPassword: false,
            isEditable: false,
            hintText: 'Your Name'),
        DefaultField(
            controller: emailController,
            name: 'E-mail',
            isPassword: false,
            isEditable: false,
            hintText: 'example@email.com'),
      ],
    );
  }
}
