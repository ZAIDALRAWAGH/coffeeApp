import 'package:flutter/material.dart';

import '../Widget/common_button.dart';
import 'view/root_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                  child: Image.asset(
                "images/bg.png",
                height: size.height,
                fit: BoxFit.cover,
              )),
              Positioned(
                bottom: 45,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Fall in Love with Coffee in Blissful Delight!",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.3),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            height: 1.3),
                      ),
                      const SizedBox(height: 20),
                      CommonButton(
                        title: "Get Started",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RootScreen(),
                          ));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
