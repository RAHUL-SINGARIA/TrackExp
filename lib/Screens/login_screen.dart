import 'package:managment/Screens/sign_up.dart';
import 'package:managment/net/flutterfire.dart';

import 'package:managment/widgets/bottomnavigationbar.dart';

import 'package:flutter/material.dart';
import 'package:managment/widgets/gradient_button.dart';
import 'package:managment/widgets/login_field.dart';
import 'package:managment/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                'Sign in.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const SocialButton(
                  iconPath: 'assets/svgs/g_logo.svg',
                  label: 'Continue with Google'),

              // const SocialButton(
              //   iconPath: 'assets/svgs/f_logo.svg',
              //   label: 'Continue with Facebook',
              //   horizontalPadding: 90,
              // ),
              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Password'),
              const SizedBox(height: 20),
              const GradientButton(),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ? ',
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
                                builder: (context) => const SignupPage()))
                      },
                      child: const Text(
                        'Sign-up',
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
