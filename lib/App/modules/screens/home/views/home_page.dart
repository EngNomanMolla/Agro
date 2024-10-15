import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_biniyog/App/Constant/Colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/model/blog_model.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/modules/Screens/home/controller/home_controller.dart';
import 'package:smart_biniyog/App/modules/Screens/project_details/views/project_details_page.dart';
import 'package:smart_biniyog/App/modules/Widgets/RemarkBestProjectWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/RemarkCategoryWidget.dart';
import 'package:smart_biniyog/App/modules/screens/blog_details/views/blog_details.dart';
import 'package:smart_biniyog/App/modules/screens/cart/views/cart_screen.dart';
import 'package:smart_biniyog/App/modules/screens/home/views/components/dashboard_section.dart';
import 'package:smart_biniyog/App/modules/utils/TextStyles.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class MyHomePageScreen extends StatefulWidget {
  MyHomePageScreen({Key? key}) : super(key: key);

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38b579),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 8.0, top: 8.0),
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/smart_biniyog.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        title: Text("Welcome to Smart Biniyog",
            style: TextStyle(
                color: Colors.white,
                overflow: TextOverflow.fade,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => CartScreen());
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        elevation: 10,
        child: Icon(Icons.phone, color: Colors.white),
        backgroundColor: Color(0xff38b579),
        onPressed: () {},
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return homeController.getCategoryProgress
              ? Center(
                  child: CircularProgressIndicator(
                  color: Color(0xff38b579),
                ))
              : SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 480,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xff38b579),
                              //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
                            ),
                            child: Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 178.0,
                                    viewportFraction: 1,
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlay: true,
                                    autoPlayCurve: Curves.linear,
                                    onPageChanged: (index, _) {
                                      _currentCarouselIndex.value = index;
                                    },
                                  ),
                                  items: homeController.sliderImages.map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              imageUrl: api_base_url + i,
                                              progressIndicatorBuilder:
                                                  (_, value, progress) {
                                                return Container(
                                                  width: double.infinity,
                                                  height: 178.0,
                                                  // Match the carousel height
                                                  color: Colors.black.withOpacity(
                                                      0.3), // Placeholder background color
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                                ValueListenableBuilder(
                                    valueListenable: _currentCarouselIndex,
                                    builder: (context, currentValue, _) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  homeController
                                                      .sliderImages.length;
                                              i++)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Container(
                                                height: 7,
                                                width: 7,
                                                decoration: BoxDecoration(
                                                    color: currentValue == i
                                                        ? blackColor
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                              ),
                                            )
                                        ],
                                      );
                                    }),
                                const DashboardSection()
                              ],
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            'Invest by category',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        SizedBox(
                          height: 100.0,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homeController.categories.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return RemarkCategoryWidget(
                                    RemarkName:
                                        homeController.categories[index].name!,
                                    icon: Icons.shop_2_rounded,
                                    onTap: () {
                                      Get.toNamed(RouteNames.projectScreen);
                                    });
                              }),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        if (homeController.projects.isEmpty)
                          SizedBox()
                        else
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              // Ensures the ListView doesn't take infinite height
                              physics: NeverScrollableScrollPhysics(),
                              // Prevents independent scrolling
                              itemCount: homeController.projects.length,
                              itemBuilder: (context, outerIndex) {
                                ProjectModel project =
                                    homeController.projects[outerIndex];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(project.projectTypeName!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff38b579))),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text('See All',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color(0xff38b579))),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      // Ensures the inner ListView has proper height
                                      physics: NeverScrollableScrollPhysics(),
                                      // Prevents inner scrolling
                                      itemCount: project.projects!.length == 3
                                          ? 3
                                          : project.projects!.length == 2
                                              ? 2
                                              : 1,
                                      itemBuilder: (context, innerIndex) {
                                        Projects _project =
                                            project.projects![innerIndex];
                                        return GestureDetector(
                                          onTap: () => Get.to(() =>
                                              ProjectDetailScreen(_project)),
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical:
                                                    7), // Adds spacing between items
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    // Aligns text to the left
                                                    children: [
                                                      Text(_project.name!,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6))),
                                                      Text(
                                                          '৳ ' +
                                                              _project
                                                                  .projectPrice! +
                                                              '/Unit',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.6))),
                                                      Row(children: [
                                                        Icon(
                                                            Icons
                                                                .timelapse_rounded,
                                                            size: 13.0,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.6)),
                                                        SizedBox(width: 2.0),
                                                        Text(_project.duration!,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6))),
                                                      ]),
                                                      Row(children: [
                                                        Icon(Icons.category,
                                                            size: 13.0,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.6)),
                                                        SizedBox(width: 2.0),
                                                        Text(
                                                            _project
                                                                .categoryName!,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.6))),
                                                      ])
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                          api_base_url +
                                                              _project.image!,
                                                          height: 90.0,
                                                          fit: BoxFit
                                                              .cover)), // For network images
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 20.0)
                                  ],
                                );
                              },
                            ),
                          ),

                        // ListView.builder(
                        //     itemCount: 2,
                        //     itemBuilder: (context,index){
                        //       ProjectModel project=homeController.projects[0];
                        //   return Container(
                        //     child: Row(
                        //       children: [
                        //         Expanded(child: Column(
                        //           children: [
                        //             Text(project.projects![index].name!),
                        //           ]
                        //         )),
                        //
                        //         Expanded(child: Image.asset(api_base_url+project.projects![index].image!))
                        //       ]
                        //     ),
                        //   );
                        // }),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: Text(
                            'Read Blog',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff38b579)),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: homeController.blogModel!.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Data blog =
                                  homeController.blogModel!.data![index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, bottom: 6.0),
                                child: GestureDetector(
                                  onTap: () => Get.to(BlogDetailsScreen(blog)),
                                  child: Card(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            child: Image.network(
                                                api_base_url + blog.image!,
                                                height: 140.0,
                                                width: Get.width,
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight:
                                                    Radius.circular(10.0)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 8.0,
                                                bottom: 4),
                                            child: Text(blog.title!,
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                )),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                bottom: 10.0),
                                            child: Text(
                                              blog.description!,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                              maxLines: 4, // Limit to two lines
                                              overflow: TextOverflow
                                                  .ellipsis, // Show ellipsis for overflow text
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0, bottom: 10.0),
                                                child: Text('See more',
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.7))),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              );
                            }),

                        SizedBox(
                          height: 8,
                        ),
                      ]),
                );
        },
      ),
    );
  }
}

class RemarksTitleWidget extends StatelessWidget {
  RemarksTitleWidget({
    Key? key,
    required this.remarksName,
    required this.onTapSeeAll,
  }) : super(key: key);

  final String remarksName;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            remarksName,
            style: TitleTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            'See all',
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }
}

class RemarksTitlebWidget extends StatelessWidget {
  RemarksTitlebWidget({
    Key? key,
    required this.remarksName,
    required this.onTapSeeAll,
  }) : super(key: key);

  final String remarksName;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
          child: Text(
            remarksName,
            style: TitleTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            "",
          ),
        )
      ],
    );
  }
}
