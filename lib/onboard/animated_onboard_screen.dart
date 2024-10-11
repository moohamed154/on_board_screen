import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zero/constants.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int index = 0;
  bool _isOut = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: width(context),
            height: height(context) * .5,
            child: AnimatedScale(
              scale: _isOut ? 0 : 1,
              duration: const Duration(milliseconds: 250),
              child: Image.asset(images[index]),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: _isOut ? width(context) + 100 : width(context) * .25,
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    titles[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 199, 59),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                AnimatedPositioned(
                  right: _isOut ? width(context) + 100 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: SizedBox(
                    width: width(context),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: Text(
                        describtions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 19, 54, 33),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(active: index == 0),
              const SizedBox(
                width: 5,
              ),
              CustomIndicator(active: index == 1),
              const SizedBox(
                width: 5,
              ),
              CustomIndicator(active: index == 2),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    index == 2 ? 'Register' : 'Skip',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _isOut = !_isOut;
                    });
                    Timer(const Duration(milliseconds: 300), () {
                      index = index > 1 ? 0 : index + 1;
                      setState(() {
                        _isOut = !_isOut;
                      });
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 199, 59),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      index == 2 ? 'Login' : 'Next',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? const Color.fromARGB(255, 255, 199, 59) : Colors.grey,
      ),
      width: active ? 30 : 10,
      height: 10,
    );
  }
}

List titles = [
  "No ads while \nlistening to music",
  "Listen to \nmusic offline",
  "Share \nYour playlist"
];

List describtions = [
  "Listening to music is my comfortable without any annoying ads",
  "Download the music you want and enjoy it whatever and whenever",
  "Share the playlist you created and share it with friends and family"
];
List images = ['assets/one.jpg', 'assets/two.jpg', 'assets/three.jpg'];
