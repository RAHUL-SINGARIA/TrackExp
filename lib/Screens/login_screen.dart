import 'package:managment/Screens/sign_up.dart';
import 'package:managment/net/flutterfire.dart';
import 'package:managment/pallete.dart';

import 'package:managment/widgets/bottomnavigationbar.dart';

import 'package:flutter/material.dart';

import 'package:managment/widgets/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
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

              const SizedBox(height: 15),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              // const LoginField(hintText: 'Email'),
              Container(
                width: 400,
                child: TextFormField(
                  controller: _emailField,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.gradient2,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Login',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // const PasswordField(hintText: 'Password'),
              Container(
                width: 400,
                child: TextFormField(
                  controller: _passwordField,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.gradient2,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // const GradientButton(),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Pallete.gradient1,
                      Pallete.gradient2,
                      Pallete.gradient3,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    bool shouldNavigate =
                        await signIn(_emailField.text, _passwordField.text);
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottom(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(395, 55),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
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
