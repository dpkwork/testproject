import 'package:flutter/material.dart';
import 'package:testesfers/screens/login_screen.dart';
import 'package:testesfers/widgets/common_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void handleNavigation(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue,
              Colors.lightBlue.withOpacity(0.7),
              Colors.purple.withOpacity(0.8),
              Colors.purple
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/microphone.png",
              height: 100,
              width: 100,
              color: Colors.white,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Welcome To",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            RichText(
                text: const TextSpan(
                    text: "MUSIC",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 25),
                    children: <TextSpan>[
                  TextSpan(
                      text: " APP",
                      style: TextStyle(fontWeight: FontWeight.normal))
                ])),
            const SizedBox(
              height: 15,
            ),
            CommonButton(label: "Login", onTap: () {
              handleNavigation(context);
            }),
            const SizedBox(
              height: 15,
            ),
            CommonButton(label: "Register", onTap: () {}),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Or Quick Login",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const Text(
              "With Touch ID",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/images/fingerprint.png",
                color: Colors.white,
                height: 70,
                width: 70,
              ),
            )
          ],
        ),
      ),
    );
  }
}
