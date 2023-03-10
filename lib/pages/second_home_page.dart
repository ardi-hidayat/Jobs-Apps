import 'package:flutter/material.dart';
import 'package:job_apps/theme.dart';
import 'package:job_apps/widgets/custom_list.dart';

class SecondHomePage extends StatelessWidget {
  //const SecondHomePage({super.key});

  final String jobTitleHome;
  final String imageUrl;

  const SecondHomePage(
      {super.key, required this.jobTitleHome, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 270,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200, left: 24),
                      child: Text(
                        jobTitleHome,
                        style: jobTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 240, left: 24),
                      child: Text(
                        '12,309 available',
                        style: availableJobTextStyle,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Big Companies',
                        style: titleListTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'Front-End Developer',
                              imageUrl: 'assets/google_icon.png',
                              companyName: 'Google'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'UI Designer',
                              imageUrl: 'assets/instagram_icon.png',
                              companyName: 'Iinstagram'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'Data Scientist',
                              imageUrl: 'assets/facebook_icon.png',
                              companyName: 'Facebook'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30.5, left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Startups',
                        style: titleListTextStyle,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'Front-End Developer',
                              imageUrl: 'assets/google_icon.png',
                              companyName: 'Google'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'UI Designer',
                              imageUrl: 'assets/instagram_icon.png',
                              companyName: 'Iinstagram'),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Column(
                        children: [
                          CustomList(
                              jobTitle: 'Data Scientist',
                              imageUrl: 'assets/facebook_icon.png',
                              companyName: 'Facebook'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
