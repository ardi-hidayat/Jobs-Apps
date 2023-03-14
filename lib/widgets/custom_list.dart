import 'package:flutter/material.dart';
import 'package:job_apps/models/job_model.dart';
import 'package:job_apps/pages/detail_page.dart';

import '../theme.dart';

class CustomList extends StatelessWidget {
  // final String jobTitle;
  // final String imageUrl;
  // final String companyName;
  // CustomList(
  //     {required this.jobTitle,
  //     required this.imageUrl,
  //     required this.companyName});

  final JobModel job;
  CustomList(this.job);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(job)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              job.companyLogo,
              width: 44,
              height: 44,
            ),
            SizedBox(
              width: 27,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.name,
                    style: jobTextStyle,
                  ),
                  Text(
                    job.companyName,
                    style: companyTextStyle,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Divider(
                    color: Color(0xffECEDF1),
                    thickness: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
