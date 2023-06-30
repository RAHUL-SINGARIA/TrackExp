import 'package:flutter/material.dart';
import 'package:managment/pallete.dart';

class GradientButtonSignUp extends StatefulWidget {
  const GradientButtonSignUp({Key? key}) : super(key: key);

  @override
  State<GradientButtonSignUp> createState() => _GradientButtonSignUpState();
}

class _GradientButtonSignUpState extends State<GradientButtonSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          'Sign up',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
