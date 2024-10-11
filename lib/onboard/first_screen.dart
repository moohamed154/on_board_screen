import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/one.jpg',
        ),
        const Text(
          'No ads while \nlistening to music',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 199, 59),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            'Listening to music is my comfortable without any annoying ads',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 19, 54, 33),
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
