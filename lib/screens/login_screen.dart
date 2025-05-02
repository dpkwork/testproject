import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:testesfers/widgets/common_button.dart';
import 'package:testesfers/widgets/common_input.dart';
import 'package:testesfers/widgets/social_button.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> loginApi() async {
    try {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        // If the form is not valid, return without doing anything
        return;
      } else {
        final response = await http.post(
          Uri.parse("https://scratchy.esferasoft.in/api/login"),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },

          body: jsonEncode(<String, dynamic>{
            "email": email.text,
            "password": password.text,
            "device_token": "sfewtegvd",
            "device_type": "android"
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final snackBar = SnackBar(content: Text("${responseData['message']}"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          throw Exception('Failed to post data');
        }
      }
    } catch (e) {
      debugPrint("Api hit error ${e}");
    }
  }

  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/mike.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
                const Text(
                  "SIGN IN \n TO CONTINUE",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CommonInput(
                          hinText: "Enter your email",
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          }),
                      const SizedBox(height: 15),
                      CommonInput(
                          controller: password,
                          obscureText: isSecure,
                          hinText: "Enter your password",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                          suffix: InkWell(
                              onTap: () {
                                isSecure = !isSecure;
                                setState(() {});
                              },
                              child: const Icon(
                                Icons.remove_red_eye,
                                size: 20,
                              ))),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                CommonButton(
                  onTap: loginApi,
                  label: "Login",
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.cyan,
                        Colors.blue.withOpacity(0.8),
                        Colors.purple.withOpacity(0.8),
                        Colors.purple
                      ]),
                ),
                const SizedBox(height: 10),
                InkWell(onTap: () {}, child: const Text("Lost Password?")),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: SocialButton(
                        onTap: () {},
                        label: "Google",
                        path: 'assets/images/google.png',
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: SocialButton(
                        onTap: () {},
                        label: "Facebook",
                        path: 'assets/images/facebook.png',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  height: 1,
                  width: 120,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                const SizedBox(height: 40),
                RichText(
                    text: const TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: " Register",
                              style: TextStyle(fontWeight: FontWeight.w700))
                        ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
