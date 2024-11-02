import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:intl/intl.dart';
import '../../../../data/model/project_model.dart';



class ProjectReviews extends StatefulWidget {

  final List<Reviews> reviews;

  ProjectReviews({required this.reviews});

  @override
  State<ProjectReviews> createState() => _ProjectReviewsState();
}

class _ProjectReviewsState extends State<ProjectReviews> {
  HomeController homeController = Get.put(HomeController());

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(parsedDate); // Formatting to 01 Jun 2024
  }

  @override
  Widget build(BuildContext context) {

    final productJson = jsonEncode(widget.reviews);

    print(productJson);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomeController>(builder: (_) {
          return ListView.builder(
            itemCount: widget.reviews.length,
            itemBuilder: (context, index) {

              // final data = widget.reviews[index];
              //
              // return Text(data.clientImage ?? '');

              return Container(
                margin: EdgeInsets.only(bottom: 15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: widget.reviews[index].clientImage==" " || widget.reviews[index].clientName == null ? Icon(Icons.person,size: 30.0,color:Colors.black.withOpacity(0.7)): Image.network(
                            api_base_url+widget.reviews[index].clientImage!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.reviews[index].clientName ?? 'Anonymous',style: TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.normal,
                                  )),
                                  buildStarRating(int.parse(widget.reviews[index].rating!)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                widget.reviews[index].reviewText!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                maxLines: 5,  // Limiting to five lines
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Commented on: ${formatDate(widget.reviews[index].createdAt!)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }

  Widget buildStarRating(int stars) {
    return Row(
      mainAxisSize: MainAxisSize.min, // To fit the number of stars closely
      children: List.generate(stars, (index) {
        return Icon(
          Icons.star,
          color: Colors.amber, // Gold color
          size: 18, // Adjusting the size as needed
        );
      }),
    );
  }
}
