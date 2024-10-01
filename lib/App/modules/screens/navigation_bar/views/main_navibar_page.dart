import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smart_biniyog/App/modules/Screens/more_page/views/more_page.dart';
import 'package:smart_biniyog/App/modules/Screens/myfarm/views/myfarms_page.dart';
import 'package:smart_biniyog/App/modules/Screens/navigation_bar/controller/navigaion_controller.dart';

import 'package:smart_biniyog/App/modules/screens/project/views/project_page.dart';
import '../../home/views/home_page.dart';


class MainBottomNavBar extends StatefulWidget {
    MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  NavigatinController _navigatinController=Get.put(NavigatinController());
 // int _selectedScreen = 0;
  final List<Widget> _screens =  [
    MyHomePageScreen(),
    ProjectPageScreen(false),
    MyFarmsScreen(),
    MorePageScreen(),

  ];











  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigatinController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: GetBuilder<NavigatinController>(
        builder: (controller) {
          return BottomNavigationBar(
            selectedItemColor:Color(0xff38b579),
            unselectedItemColor: Colors.black38,
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            onTap: (value) {
             controller.changeIndex(value);
            },
            elevation: 4,
            currentIndex:controller.selectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.account_tree_outlined), label: 'Projects'),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance_sharp), label: 'My Farm'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'More'),
            ],
          );
        }
      ),


    );
  }
}