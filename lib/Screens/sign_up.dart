import 'package:managment/Screens/login_screen.dart';
import 'package:managment/net/flutterfire.dart';

import 'package:managment/widgets/bottomnavigationbar.dart';

import 'package:flutter/material.dart';
import 'package:managment/widgets/gradient_button.dart';
import 'package:managment/widgets/login_field.dart';
import 'package:managment/widgets/name_field.dart';
import 'package:managment/widgets/sign_up_button.dart';
import 'package:managment/widgets/social_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign up.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const NameField(hintText: 'name'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              const GradientButtonSignUp(),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ? ',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff939393),
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()))
                      },
                      child: const Text(
                        'Sign-in',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff748288),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
