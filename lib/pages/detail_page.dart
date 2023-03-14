import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_apps/models/job_model.dart';
import 'package:job_apps/theme.dart';

class DetailPage extends StatefulWidget {
  final JobModel job;
  DetailPage(this.job);

  //const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isApplied = false;

  Widget detailItem(String text) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.adjust,
            color: Color(0xff4141A4),
            size: 12,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              text,
              style: requirmentTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget applyButton() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 51.0,
        ),
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66),
              ),
              backgroundColor: Color(0xff4141A4),
            ),
            onPressed: () {
              setState(() {
                isApplied = !isApplied;
              });
            },
            child: Text(
              'Apply for Job',
              style: buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget cancelApply() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 51.0,
        ),
        child: Container(
          width: 200,
          height: 45,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(66),
              ),
              backgroundColor: Color(0xffFD4F56),
            ),
            onPressed: () {
              setState(() {
                isApplied = !isApplied;
              });
            },
            child: Text(
              'Cancel Apply',
              style: buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  Widget successMessage() {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xffECEDF1),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Text(
        'You have applied this job and the \nrecruiter will contact you',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Color(0xffA2A6B4),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              isApplied ? successMessage() : SizedBox(),
              Image.network(
                widget.job.companyLogo,
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.job.companyName,
                style: jobApplyTextStyle,
              ),
              Text(
                "${widget.job.companyName} • '${widget.job.location}",
                style: companyTextStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About the job',
                          style: titleRequirmentTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.about
                          .map((text) => detailItem(text))
                          .toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Text(
                          'Qualifications',
                          style: titleRequirmentTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.qualifications
                          .map((text) => detailItem(text))
                          .toList(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Responsibilities',
                          style: titleRequirmentTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: widget.job.responsibilities
                          .map((text) => detailItem(text))
                          .toList(),
                    ),
                    isApplied ? cancelApply() : applyButton(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Message Recruiter',
                              style: messageBtnTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
