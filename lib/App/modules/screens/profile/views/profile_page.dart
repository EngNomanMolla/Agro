import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/screens/Financial/views/financial_page.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking/views/mbankin_page.dart';
import 'package:smart_biniyog/App/modules/screens/nominee/views/nominee_page.dart';
import 'package:smart_biniyog/App/modules/screens/personal_info/views/personal_info.dart';
import 'package:smart_biniyog/App/modules/screens/profile/controller/profile_controller.dart';

class ProfilePageScreen extends GetView<ProfileController> {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Profile')),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Personal'),
              Tab(icon: Icon(Icons.balance), text: 'Bank Info'),
              Tab(icon: Icon(Icons.send_to_mobile), text: 'M_Banking'),
               Tab(icon: Icon(Icons.privacy_tip), text: 'Nominee'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PersonalInfoScreen(),
            FinancialScreen(),
            MobileBanking(),
            NomineeScreen()

          ],
        ),
      ),
    );

    //   DefaultTabController(
    //   length: 4,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       automaticallyImplyLeading: false,
    //       title: Center(
    //         child: const Text(
    //           'Profile',
    //           style: TextStyle(
    //             fontFamily: 'Montserrat',
    //             color:Colors.black,
    //           ),
    //         ),
    //       ),
    //       //backgroundColor:Colors.red,
    //       bottom: TabBar(
    //         indicatorColor: Color(0xff6200EE),
    //         labelColor: Colors.grey,
    //         unselectedLabelColor:Colors.grey,
    //         indicatorWeight: 4.0,
    //         labelStyle: TextStyle(
    //             fontSize: 16.0,
    //             fontFamily: "Montserrat",
    //             fontWeight: FontWeight.bold
    //         ),
    //         tabs: const [
    //           Tab(text: 'Personal',),
    //           Tab(text: 'Bank Info'),
    //           Tab(text: 'Mbanking'),
    //           Tab(text: 'Nominee'),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         PersonalInfoScreen(),
    //         FinancialScreen(),
    //         MobileBanking(),
    //         NomineeScreen()
    //       ],
    //     ),
    //   ),
    // );
  }
}
