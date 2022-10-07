// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/views/screens/home_screen.dart';
import 'package:zoom_app/views/screens/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Start or join a meeting',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Image.asset(
            'assets/images/onboarding.jpg',
          ),
        ),
        CustomButton(
          text: 'Google Sign In',
          onPressed: () {
            _authController.SignInWithGoogle();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
          },
        ),
      ],
    ));
  }
}
