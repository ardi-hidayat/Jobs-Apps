import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_apps/pages/second_home_page.dart';

class JobCard extends StatelessWidget {
  // const JobCard({super.key});

  final String text;
  final String imageUrl;

  JobCard({required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondHomePage(
              imageUrl: imageUrl,
              jobTitleHome: text,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Container(
          width: 150,
          height: 200,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 15, right: 10),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
      ),
    );
  }
}
