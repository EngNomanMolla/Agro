import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:intl/intl.dart';
import '../../../../data/model/project_model.dart';



class ProjectReviews extends StatelessWidget {

  List<Reviews> reviews=[];

  ProjectReviews(this.reviews);
  HomeController homeController = Get.put(HomeController());

  String formatDate(String date) {
    final DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd MMM yyyy').format(parsedDate); // Formatting to 01 Jun 2024
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomeController>(builder: (_) {
          return ListView.builder(
            itemCount: reviews.length,
            itemBuilder: (context, index) {
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
                          child: reviews[index].clientImage==" "? Icon(Icons.person,size: 30.0,color:Colors.black.withOpacity(0.7)): Image.network(
                            api_base_url+reviews[index].clientImage!,
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
                                  Text(reviews[index].clientName!,style: TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.normal,
                                  )),
                                  buildStarRating(int.parse(reviews[index].rating!)),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                reviews[index].reviewText!,
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
                        'Commented on: ${formatDate(reviews[index].createdAt!)}',
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
