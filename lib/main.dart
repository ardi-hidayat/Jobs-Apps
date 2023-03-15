import 'package:flutter/material.dart';
import 'package:job_apps/pages/home_page.dart';
import 'package:job_apps/pages/signin_page.dart';
import 'package:job_apps/pages/signup_page.dart';
import 'package:job_apps/pages/splash_page.dart';
import 'package:job_apps/pages/started_page.dart';
import 'package:job_apps/providers/auth_provider.dart';
import 'package:job_apps/providers/category_provider.dart';
import 'package:job_apps/providers/job_provider.dart';
import 'package:job_apps/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(create: (context) => JobProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: SplashPage(),
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => StartedPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
