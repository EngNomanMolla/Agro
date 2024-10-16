import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/model/project_model.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/data/service/network_caller.dart';
import 'package:smart_biniyog/App/modules/Screens/about_page.dart';
import 'package:smart_biniyog/App/modules/Screens/summary_page.dart';
import 'package:smart_biniyog/App/modules/Screens/profit_simulation/views/profit_simu_page.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/screens/cart/controller/cart_controller.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/views/project_reviewlist_page.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/views/project_reviews.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class ProjectDetailScreen extends StatefulWidget {
  Projects project;

  ProjectDetailScreen(this.project);

  @override
  _ProjectDetailScreenState createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  final controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    controller.tempTotalPrice.value = widget.project.projectPrice!;
    controller.tempTotalQuantity.value = '1';
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  // Method to handle button press
  void _onButtonPressed() async {
    if (AuthUtils.isLoggedIn) {
      setState(() {
        isLoading = true;
      });

      final isUpToDate = await NetworkUtils().checkUpToDate();

      if (!isUpToDate) {
        showSnackBarMessage(Get.context!, 'Please setup your profile before you want to place an order!');
        Get.toNamed(RouteNames.profile);
        setState(() {
          isLoading = false;
        });
        return;
      }

      final response = await NetworkUtils().order(orderData: {
        "total_amount": controller.tempTotalPrice.value,
        "projects": [
          {
            "id": widget.project.id.toString(),
            "quantity": controller.tempTotalQuantity.value,
            "price": controller.tempTotalPrice.value,
          }
        ],
        "transaction_number": "TRX123456789",
        "payment_method": "bkash",
        "refferal_code": "",
        "customer_note": "Thank you for your purchase"
      });

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200) {
        Get.offAllNamed(RouteNames.mainNavigationScreen);
        showSnackBarMessage(context, 'Order successfully placed!');
      } else {
        showSnackBarMessage(context, response.body);
      }
    } else {
      showSnackBarMessage(context, 'Please login to place order!');
      Get.to(RouteNames.logInScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        backgroundColor: Color(0xff38b579),
        title: Text(
          'Project Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 27,
            child: Row(
              children: [
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Image.network(
                      '$api_base_url${widget.project.image ?? ''}',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Color(0xff38b579),
                    labelColor: Color(0xff38b579),
                    unselectedLabelColor: Colors.black,
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Summary'),
                      Tab(text: 'Profit Simulation'),
                      Tab(text: 'About'),
                      Tab(text: 'Project Reviews'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Center(child: SummaryScreen(widget.project)),
                      Center(child: ProfitSimuScreen(widget.project)),
                      Center(child: AboutSreen(widget.project.about!)),
                      Center(child: ProjectReviews(widget.project.reviews!)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppElevatedButton(
              Color: Color(0xff38b579),
              onTap: _onButtonPressed,
              child: Center(
                child: isLoading
                    ? SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        "Book Now",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                          ),
                        ),
                      ),
              ),
            ),
          )

          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: AppElevatedButton(
          //     Color: Colors.green,
          //     onTap: _onButtonPressed,
          //     child: Center(
          //       child: Text(
          //         _selectedIndex == _tabController.length - 1 // Check if it's the last tab
          //             ? "Add to Cart" // Show "Add to Cart" for the last tab
          //             : "Next", // Show "Next" for other tabs
          //         style: GoogleFonts.poppins(
          //           textStyle: const TextStyle(
          //             color: Color(0xFFFFFFFF),
          //             fontSize: 16,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
