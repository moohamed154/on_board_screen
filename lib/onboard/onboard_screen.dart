import 'package:flutter/material.dart';
import 'package:zero/onboard/first_screen.dart';
import 'package:zero/onboard/second_screen.dart';
import 'package:zero/onboard/third_screen.dart';

class OnboardScreen2 extends StatefulWidget {
  const OnboardScreen2({super.key});

  @override
  State<OnboardScreen2> createState() => _OnboardScreen2State();
}

class _OnboardScreen2State extends State<OnboardScreen2> {
  PageController _controller = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              controller: _controller,
              children: const [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
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
                    if (index == 2) {
                    } else {
                      _controller.animateToPage(index + 1,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    }
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
