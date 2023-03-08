import 'package:flutter/material.dart';

import '../theme.dart';

class CustomList extends StatelessWidget {
  final String jobTitle;
  final String imageUrl;
  final String companyName;

  CustomList(
      {required this.jobTitle,
      required this.imageUrl,
      required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
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
                jobTitle,
                style: jobTextStyle,
              ),
              Text(
                companyName,
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
    );
  }
}
