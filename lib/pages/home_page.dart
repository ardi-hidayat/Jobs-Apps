import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_apps/theme.dart';
import 'package:job_apps/widgets/custom_list.dart';
import 'package:job_apps/widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy',
                      style: titleTextStyle,
                    ),
                    Text(
                      'Jason Powell',
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/user_pic.png',
                  width: 58,
                  height: 58,
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text('Hot Categories', style: titleListTextStyle),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24,
                ),
                child: Row(
                  children: [
                    JobCard(
                        text: 'Website Developer',
                        imageUrl: 'assets/card_category.png'),
                    SizedBox(
                      width: 16,
                    ),
                    JobCard(
                        text: 'Mobile Developer',
                        imageUrl: 'assets/card_category2.png'),
                    SizedBox(
                      width: 16,
                    ),
                    JobCard(
                        text: 'App Designer',
                        imageUrl: 'assets/card_category3.png')
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Just Post',
                style: GoogleFonts.poppins(
                  color: Color(0xff272C2F),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 24.0),
              child: CustomList(
                  jobTitle: 'Front-End Developer',
                  imageUrl: 'assets/google_icon.png',
                  companyName: 'Google'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 24.0),
              child: CustomList(
                  jobTitle: 'UI Designer',
                  imageUrl: 'assets/instagram_icon.png',
                  companyName: 'Instagram'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 24.0),
              child: CustomList(
                  jobTitle: 'Data Scientist',
                  imageUrl: 'assets/facebook_icon.png',
                  companyName: 'Facebook'),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: Color(0xffB3B5C4),
          selectedItemColor: Color(0xff272C2F),
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_one.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_two.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_three.png'),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/navbar_four.png'),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [header(), body()],
        ),
      ),
    );
  }
}
