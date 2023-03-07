import 'package:flutter/material.dart';
import 'package:job_apps/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 24,
            right: 24,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Sign In',
              style: titleTextStyle,
            ),
            Text(
              'Begin New Journey',
              style: subTitleTextStyle,
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/ilustration_one.png',
                    width: 262,
                    height: 240,
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
