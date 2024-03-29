import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_apps/models/user_model.dart';
import 'package:job_apps/providers/auth_provider.dart';
import 'package:job_apps/providers/user_provider.dart';
import 'package:job_apps/theme.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController goalController = TextEditingController(text: '');

  bool isEmailValid = true;
  bool isUploaded = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    }

    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: titleTextStyle,
            ),
            Text(
              'Begin New Journey',
              style: subTitleTextStyle,
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    }

    Widget uploadedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/upload_pic.png',
                width: 120,
                height: 120,
              )
            ],
          ),
        ),
      );
    }

    Widget showedImages() {
      return Center(
        child: InkWell(
          onTap: () {
            setState(() {
              isUploaded = !isUploaded;
            });
          },
          child: Column(
            children: [
              Image.asset(
                'assets/user_pic.png',
                width: 120,
                height: 120,
              )
            ],
          ),
        ),
      );
    }

    Widget inputFullName() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Full Name',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputEmailAddress() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: emailController,
              onChanged: (value) {
                print(value);
                bool isValid = EmailValidator.validate(value);
                print(isValid);
                if (isValid) {
                  setState(() {
                    isEmailValid = true;
                  });
                } else {
                  setState(() {
                    isEmailValid = false;
                  });
                }
              },
              decoration: InputDecoration(
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    color: isEmailValid ? Color(0xff4141A4) : Color(0xffFD4F56),
                  ),
                ),
                hintText: '',
              ),
              style: TextStyle(
                color: isEmailValid ? Color(0xff4141A4) : Color(0xffFD4F56),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(
                    color: Color(0xff4141A4),
                  ),
                ),
                hintText: '',
              ),
            ),
          ],
        ),
      );
    }

    Widget inputYourGoal() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Goal',
              style: titleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: goalController,
              decoration: InputDecoration(
                fillColor: Color(0xffF1F0F5),
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
      );
    }

    Widget buttonSignUp() {
      return Container(
        width: 400,
        height: 45,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff4141A4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66),
                  ),
                ),
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      goalController.text.isEmpty) {
                    showError('Semua field harus di isi');
                  } else {
                    setState(() {
                      isLoading = true;
                    });

                    UserModel? user = await authProvider.register(
                        emailController.text,
                        passwordController.text,
                        nameController.text,
                        goalController.text);

                    setState(() {
                      isLoading = false;
                    });

                    if (user == null) {
                      showError('Email sudah terdaftar');
                    } else {
                      userProvider.user = user;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HomePage()),
                      // );
                    }
                  }
                },
                child: Text(
                  'Sign Up',
                  style: buttonTextStyle,
                ),
              ),
      );
    }

    Widget buttoBackSignIn() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0, bottom: 70.0),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/sign-in');
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SignInPage()),
              // );
            },
            child: Text(
              'Back to Sign In',
              style: GoogleFonts.poppins(
                color: Color(0xffB3B5C4),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70.0, left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(
                  height: 40,
                ),
                isUploaded ? showedImages() : uploadedImages(),
                SizedBox(
                  height: 50,
                ),
                inputFullName(),
                SizedBox(
                  height: 20,
                ),
                inputEmailAddress(),
                SizedBox(
                  height: 20,
                ),
                inputPassword(),
                SizedBox(
                  height: 20,
                ),
                inputYourGoal(),
                SizedBox(
                  height: 50,
                ),
                buttonSignUp(),
                buttoBackSignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
