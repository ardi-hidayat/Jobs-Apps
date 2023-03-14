import 'package:flutter/material.dart';
import 'package:job_apps/pages/splash_page.dart';
import 'package:job_apps/providers/auth_provider.dart';
import 'package:job_apps/providers/category_provider.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
