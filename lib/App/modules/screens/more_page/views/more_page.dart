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

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome to '),
          Row(
            children: [
              Text(
                'SMART ',
                style: TitleTextStyle.copyWith(
                    color: greyColor,
                    fontWeight: FontWeight.bold,
                fontSize: 20),
              ),
              Text(
                'BINIYOG ',
                style: TitleTextStyle.copyWith(
                    color: primaryColor, fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),

        ],

      ),
      leading:  CircleAvatar(
        radius: 700,
        child:  Center(
          child: Image.asset(
            'assets/images/smart_biniyog.png',
            fit: BoxFit.fill,
          ),
        ),

      ),

      ),



      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,  //     Get.toNamed(RouteNames.profile);
              child: InkWell(
                onTap: (){
                  Get.toNamed(RouteNames.profile);
                },
                child: Container(
                    width: double.infinity,
                    color: Colors.green[50],
                    height: 60,
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),
                      title: Text('profile'),
                      leading: Icon(Icons.perm_identity_outlined)


                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                width: double.infinity,
                color: Colors.green[50],
                  height: 60,

                  child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Support'),
                    leading: IconButton(onPressed: (){}, icon: Icon(Icons.chat)),


                  )),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen()));
                },
                child: Container(
                    width: double.infinity,
                    color: Colors.green[50],
                    height: 60,

                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Contact'),
                      leading: Icon(Icons.people),


                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));

                },
                child: Container(
                    width: double.infinity,
                    color: Colors.green[50],
                    height: 60,

                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('About Us'),
                      leading: Icon(Icons.badge_rounded),


                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => FaqQuestion()));
                },
                child: Container(
                    width: double.infinity,
                    color: Colors.green[50],
                    height: 60,

                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('FAQ'),
                      leading: Icon(Icons.quiz)



                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyScreen()));
                },
                child: Container(
                    width: double.infinity,
                    color: Colors.green[50],
                    height: 60,

                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text('Privacy policy'),
                      leading:Icon(Icons.calendar_month_sharp),


                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Container(
                  width: double.infinity,
                  color: Colors.green[50],
                  height: 60,

                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text('Login'),
                    leading: IconButton(onPressed: (){

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LogInSreen()),);

                    }, icon: Icon(Icons.login)),


                  )),
            ),
          ),





        ],
      ),
    );
  }
}
