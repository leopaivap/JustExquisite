import 'package:fashion/util/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultField extends StatefulWidget {
  DefaultField({
    super.key,
    required this.controller,
    required this.name,
    required this.isPassword,
    required this.hintText,
  });

  final String name, hintText;
  final TextEditingController controller;
  bool isPassword = false;

  @override
  State<DefaultField> createState() => _DefaultFieldState();
}

class _DefaultFieldState extends State<DefaultField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          !widget.isPassword
              ? TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: widget.hintText,
                  ),
                )
              : TextField(
                  controller: widget.controller,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                    hintText: widget.hintText,
                  ),
                ),
        ],
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(0, 0, 0, 0.8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class CategoryFrame extends StatelessWidget {
  const CategoryFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Category',
                style: kTitleStyle,
              ),
              GestureDetector(
                onTap: () {
                  //TODO - abrir todas as categorias
                },
                child: const Text('See All'),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  CategoryButton(
                    icon: Icons.abc_sharp,
                    name: 'Teste',
                  ),
                  CategoryButton(
                    icon: Icons.abc_sharp,
                    name: 'Teste',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.icon,
    required this.name,
  });

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class NewsBoard extends StatelessWidget {
  const NewsBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade200,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New Collection',
            style: kTitleStyle,
          ),
          Text('Discount 50% for \nthe first transaction'),
          SizedBox(height: 15),
          DefaultLittleButtton(
            name: 'Shop Now',
            isSelectable: false,
          ),
        ],
      ),
    );
  }
}

class DefaultLittleButtton extends StatefulWidget {
  const DefaultLittleButtton(
      {super.key, required this.name, required this.isSelectable});

  final String name;
  final bool isSelectable;

  @override
  State<DefaultLittleButtton> createState() => _DefaultLittleButttonState();
}

class _DefaultLittleButttonState extends State<DefaultLittleButtton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget.isSelectable) {
          setState(() {
            //TODO - logica para trocar de cor
          });
        }
      },
      style: widget.isSelectable == false
          ? ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 0.8)),
            )
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          widget.name,
          style:
              widget.isSelectable == false ? kLitteTextWhite : kLitteTextBlack,
        ),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications_on_sharp,
          color: Colors.black,
        ),
      ),
    );
  }
}
