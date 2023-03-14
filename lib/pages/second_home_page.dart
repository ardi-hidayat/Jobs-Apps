import 'package:flutter/material.dart';
import 'package:job_apps/models/category_model.dart';
import 'package:job_apps/providers/job_provider.dart';
import 'package:job_apps/theme.dart';
import 'package:job_apps/widgets/custom_list.dart';
import 'package:provider/provider.dart';

import '../models/job_model.dart';

class SecondHomePage extends StatelessWidget {
  //const SecondHomePage({super.key});

  // final String jobTitleHome;
  // final String imageUrl;
  // const SecondHomePage(
  //     {super.key, required this.jobTitleHome, required this.imageUrl});

  final CategoryModel category;
  const SecondHomePage(this.category);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
                        child: Image.network(
                          category.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200, left: 24),
                      child: Text(
                        category.name,
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
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Big Companies',
                          style: titleListTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobsByCategory(category.name),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: snapshot.data!
                                  .map((job) => CustomList(job))
                                  .toList(),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 30.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'New Startups',
                          style: titleListTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FutureBuilder<List<JobModel>>(
                        future: jobProvider.getJobs(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: snapshot.data!
                                  .map((job) => CustomList(job))
                                  .toList(),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
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
