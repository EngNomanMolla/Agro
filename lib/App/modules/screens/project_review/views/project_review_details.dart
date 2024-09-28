import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_biniyog/App/Constant/Colors.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppElevatedButtonWidget.dart';
import 'package:smart_biniyog/App/modules/Widgets/AppTextFieldWidget.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/controller/project_review_list_controller.dart';
import 'package:smart_biniyog/App/modules/utils/snackbar_message.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';


class ProjectReviewDetails extends StatefulWidget {
  const ProjectReviewDetails({Key? key}) : super(key: key);

  @override
  State<ProjectReviewDetails> createState() => _ProjectReviewDetailsState();
}

class _ProjectReviewDetailsState extends State<ProjectReviewDetails> {
  ProjectReviewDetailsController projectReviewDetailsController=Get.put(ProjectReviewDetailsController());
var id;
  @override
  Widget build(BuildContext context) {
    //
    // final Map<String, String> arguments = Get.arguments;
    // id =arguments['id'];
    // print(arguments['id']);
    return  Scaffold(
      appBar: AppBar(title:  Center(
        child: Text('Review Details'),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Image.asset('assets/images/Agriculture.jpg',
                  height:300 ,
                  //width: double.infinity,
                  fit: BoxFit.fill,

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  GetBuilder<ProjectReviewDetailsController>(
                    builder: (ProjectReviewDetailsController) {
                      return Container(
                        height: 48,
                        width: 200,
                        color: Colors.white,
                        child: AppElevatedButton(
                          Color: primaryColor,
                          onTap: () {
                            MyAlertDialog(context);
                          },

                          child:  Center(
                            child: Text("Knowledge",
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing:1.5,

                                ),
                              ),

                            ),
                          ),
                        ),
                      );
                    }
                  ),


                 SizedBox(height: 10,),
                 Text('bangladesh Interntional expo-'),
                  Text('bangladesh Interntional expo-বাংলা কবিতা এর উৎপত্তি হয়েছিলো মূলত পালি এবং প্রাকৃত সংস্কৃতি এবং সামাজিক রীতি থেকে। এটি বৈদিক ধর্মীয় ধর্মানুষ্ঠান এবং বৌদ্ধ ধর্ম ও জৈন ধর্ম এর রীতিনীতির সাথে অসামঞ্জস্যপূর্ণ এবং পরস্পর বিরোধি ছিলো। তবে আধুনিক বাংলার সংস্কৃত ভাষা ভাষার উপর ভিত্তি করেই তৈরী হয় নি। উইকিপিডিয়াবাংলা কবিতার সকল শ্রদ্ধেয়/সুপ্রিয় কবি বন্ধুগণ ইতিমধ্যে (বিগত ১৪/৭/২০২৪ এবং ২১/০৭/২০২৪ এর অন লাইন সভায় সিধ্যান্ত অনুসারে) অবগত হয়েছেন যে, আগামী ১৪-১৫ সেপ্টেম্বর ২০২৪ (শনি ও রবিবার) বাংলা কবিতা ডট কম (ভারত) এর কবি সম্মিলন পশ্চিমবঙ্গের পূর্ব মেদিনীপুর জেলার বঙ্গোপসাগর উপকূলবর্তী শহর দীঘায় অনুষ্ঠিত হবে।১। আগামী ১৪/৮/২০২৪ তারিখের পূর্বে আগ্রহী কবিগণ কে জনপ্রতি টাকা- ১,০০০/- (এক হাজার) জমা করে নিবন্ধন করতে হবে। এই ১০০০/- টাকা অনুদানের মধ্যে ( হলভাড়া, সকালের জলখাবার, চা, দুপুরের খাবার এবং স্মারক ...'),


//
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
                title: Text("Review"),
              //  content: Text("Are You sure you want to log out?"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppTextFieldWidget(
                           // obscureText: _obscureText,
                            hintText: 'rating',
                            controller: _ratingETController,

                            validator: (value) {
                              if ((value?.isEmpty ?? true) ) {
                                return 'Enter a password with more than 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          AppTextFieldWidget(
                            //obscureText: _obscureText,
                            maxLines: 4,
                            hintText: 'review_text',
                            controller: _reviewETController,

                            validator: (value) {
                              if ((value?.isEmpty ?? true) ) {
                                return 'Enter a password with more than 6 characters';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          GetBuilder<ProjectReviewDetailsController>(
                            builder: (ProjectReviewDetailsController) {
                              return Container(
                                height: 48,
                                width: 358,
                                color: Colors.blueGrey,
                                child: AppElevatedButton(

                                  Color: Colors.blueGrey,
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                     // print(' result:$id');
                                      // final result = await ProjectReviewDetailsController.ProjectReviews(
                                      //   id.toString(),
                                      //   _ratingETController.text.trim(),
                                      //   _reviewETController.text.trim(),
                                      // );

                                      // if (result != null && result['status'] == 'true') {
                                      //   showSnackBarMessage(
                                      //       context, 'OTP sent to the email address');
                                      // } else {
                                      //   showSnackBarMessage(
                                      //       context, 'OTP sent failed. Try again.', true);


                                        //  //   //String text = _emailETController.text;
                                        //  //
                                        //  //   // final result = await NetworkUtils().postMethod(
                                        //  //   //   'https://test.smartbiniyog.com/api/client-v1/send-otp',
                                        //  //   //   body: {
                                        //  //   //     'contact': _emailETController.text.trim(),
                                        //  //   //   },
                                        //  //   // );
                                        //  //   //
                                        //  //   // if (result != null && result['status'] == 'true') {
                                        //  //   //   Get.toNamed(RouteNames.phnEmailOtpScreen,
                                        //  //   //       arguments: {'email':_emailETController.text}
                                        //  //   //   );
                                        //  //   //   showSnackBarMessage(
                                        //  //   //       context, 'Registration successful!');
                                        //  //   // } else {
                                        //  //   //   showSnackBarMessage(context,
                                        //  //   //       'Registration Failed! Try again', true);
                                        //  //   // }
                                    //  }

                                    }
                                  },
                                  child: Center(
                                    child: _isLoading
                                        ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    )
                                        : Text(
                                      "Submit",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
        });
  }



  final TextEditingController _reviewETController = TextEditingController();
  final TextEditingController _ratingETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;



}
