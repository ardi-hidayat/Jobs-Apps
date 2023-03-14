import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_apps/models/category_model.dart';
import 'package:job_apps/models/job_model.dart';
import 'package:job_apps/providers/category_provider.dart';
import 'package:job_apps/providers/job_provider.dart';
import 'package:job_apps/providers/user_provider.dart';
import 'package:job_apps/theme.dart';
import 'package:job_apps/widgets/custom_list.dart';
import 'package:job_apps/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

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
                      userProvider.user.name,
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
            Container(
              height: 200,
              child: FutureBuilder<List<CategoryModel>>(
                  future: categoryProvider.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!
                            .map((category) => JobCard(category))
                            .toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
              ),
              child: Text(
                'Just Post',
                style: GoogleFonts.poppins(
                  color: Color(0xff272C2F),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children:
                        snapshot.data!.map((job) => CustomList(job)).toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
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
