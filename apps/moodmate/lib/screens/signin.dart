import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        //color: Colors.blue, // set the background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 200,
              child: Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                textAlign: TextAlign.center,
                softWrap: true,
                //overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 40),

            SocialLoginButton(
              buttonType: SocialLoginButtonType.google,
              width: 300.0,
              onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}
