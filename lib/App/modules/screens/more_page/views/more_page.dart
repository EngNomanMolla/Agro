import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/Constant/Colors.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/views/logIn_page.dart';
import 'package:smart_biniyog/App/modules/Screens/more_page/controller/more_controller.dart';
import 'package:smart_biniyog/App/modules/screens/about/views/about_page.dart';
import 'package:smart_biniyog/App/modules/screens/contact/views/contact_page.dart';
import 'package:smart_biniyog/App/modules/screens/faq_question/views/faq_question.dart';
import 'package:smart_biniyog/App/modules/screens/privacy/views/privacy_page.dart';
import 'package:smart_biniyog/App/modules/screens/profile/views/profile_page.dart';
import 'package:smart_biniyog/App/modules/utils/TextStyles.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';



class MorePageScreen extends GetView<MoreController> {
  const MorePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         backgroundColor: Color(0xff38b579),
         title: Text('More',style: TextStyle(color: Colors.white)),
       ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){
                    Get.toNamed(RouteNames.profile);
                  },
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                    title: Text('Profile',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                    leading: Icon(Icons.perm_identity_outlined,color: Colors.white)


                  ),
                ),
              ),
              SizedBox(height: 5.0),

              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                      title: Text('Support',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                      leading: Icon(Icons.chat,color: Colors.white)


                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                      title: Text('Contact',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                      leading: Icon(Icons.contact_phone,color: Colors.white)


                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                      title: Text('About Us',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                      leading: Icon(Icons.info_outline,color: Colors.white)


                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                      title: Text('Privacy Policy',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                      leading: Icon(Icons.policy,color: Colors.white)


                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Card(
                color: Color(0xff38b579), //     Get.toNamed(RouteNames.profile);
                child: InkWell(
                  onTap: (){

                  },
                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.white.withOpacity(0.7)),
                      title: Text('Login',style: TextStyle(color: Colors.white,fontSize: 17.0)),
                      leading: Icon(Icons.login_outlined,color: Colors.white)


                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
