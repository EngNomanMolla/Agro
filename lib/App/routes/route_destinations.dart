
import 'package:get/get.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/bindings/auth_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/views/dashbord_page.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/views/logIn_page.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/views/phn_email_otpverify_page.dart';
import 'package:smart_biniyog/App/modules/Screens/auth/views/splash_page.dart';
import 'package:smart_biniyog/App/modules/Screens/home/binding/home_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/home/views/home_page.dart';
import 'package:smart_biniyog/App/modules/Screens/more_page/bindding/more_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/more_page/views/more_page.dart';
import 'package:smart_biniyog/App/modules/Screens/mycard/views/mycard_page.dart';
import 'package:smart_biniyog/App/modules/Screens/myfarm/bindding/mayfarm_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/navigation_bar/bindding/navigation_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/navigation_bar/views/main_navibar_page.dart';

import 'package:smart_biniyog/App/modules/Screens/profit_simulation/binding/profit_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/profit_simulation/views/profit_simu_page.dart';
import 'package:smart_biniyog/App/modules/Screens/project_details/bindding/projectdetails_bindding.dart';
import 'package:smart_biniyog/App/modules/Screens/project_details/views/project_details_page.dart';
import 'package:smart_biniyog/App/modules/screens/allproject/binding/allproject_binding.dart';
import 'package:smart_biniyog/App/modules/screens/allproject/views/all_project_page.dart';
import 'package:smart_biniyog/App/modules/screens/best_project/bindding/best_project_bindding.dart';
import 'package:smart_biniyog/App/modules/screens/best_project/views/best_project_page.dart';
import 'package:smart_biniyog/App/modules/screens/change_financial/binding/change_finan_binding.dart';
import 'package:smart_biniyog/App/modules/screens/change_financial/views/change_financial-page.dart';
import 'package:smart_biniyog/App/modules/screens/change_nominee/binding/change_nominee_binding.dart';
import 'package:smart_biniyog/App/modules/screens/change_nominee/views/change_nominee.dart';
import 'package:smart_biniyog/App/modules/screens/change_person_Info/binding/changeper_binding.dart';
import 'package:smart_biniyog/App/modules/screens/change_person_Info/views/change_info.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking%20change/binding/m_binding.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking%20change/views/mbanking-change.dart';
import 'package:smart_biniyog/App/modules/screens/person_info_sub/bindding/person_info_bindding.dart';
import 'package:smart_biniyog/App/modules/screens/person_info_sub/views/personal_Info_page.dart';
import 'package:smart_biniyog/App/modules/screens/profile/binding/profile_binding.dart';
import 'package:smart_biniyog/App/modules/screens/profile/views/profile_page.dart';
import 'package:smart_biniyog/App/modules/screens/project/bindding/project_bindding.dart';
import 'package:smart_biniyog/App/modules/screens/project/views/project_page.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/bindding/project_review_list_bindding.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/views/project_review_details.dart';
import 'package:smart_biniyog/App/modules/screens/project_review/views/project_reviewlist_page.dart';
import 'package:smart_biniyog/App/modules/screens/short_term/binding/short_term_binding.dart';
import 'package:smart_biniyog/App/modules/screens/short_term/views/shor_term-page.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';


class RouteDestinations{
  static List<GetPage> pages = [
    GetPage(name: RouteNames.dashBoard, page:()=> const DashBoardScreen(),binding: DashBoardBinding()),
    GetPage(name: RouteNames.splashScreen, page:()=> SplashScreen(),binding: SplashBinding()),
    GetPage(name: RouteNames.logInScreen, page:()=>  LogInSreen(),binding: LogInBinding()),
    GetPage(name: RouteNames.homeScreen, page:()=> MyHomePageScreen(),binding: HomeBinding()),
    GetPage(name: RouteNames.phnEmailOtpScreen, page:()=>  PhnEmailOtpVerifyScreen(),binding: PhnEmailOtpBinding()),
    GetPage(name: RouteNames.mainNavigationScreen, page:()=>  MainBottomNavBar(),binding: NavigaionBinding()),
    GetPage(name: RouteNames.myCardScreen, page:()=> MyCardScreen(),binding: MyCardBinding()),
    GetPage(name: RouteNames.personInfoScreen, page:()=> const PersonInfoScreen(),binding: PersonInfoBinding()),
    GetPage(name: RouteNames.projectScreen, page:()=>  ProjectPageScreen(true),binding: ProjectBinding()),
    GetPage(name: RouteNames.moreScreen, page:()=> const MorePageScreen(),binding: MoreBinding()),
    GetPage(name: RouteNames.bestProject, page:()=> const BestProjectScreen(),binding: BestProjectBinding()),
    GetPage(name: RouteNames.projectReviewList, page:()=> const ProjectReviewList(),binding: ProjectReviewListBinding()),
    GetPage(name: RouteNames.projectReviewDetail, page:()=>  const ProjectReviewDetails(),binding: ProjectReviewDetailsBinding()),
    GetPage(name: RouteNames.profile, page:()=> const ProfilePageScreen(),binding: ProfileBinding()),
    GetPage(name: RouteNames.changePersonalInfo, page:()=> const ChangePerInfo(),binding: ChangePerInfoBinding()),
    GetPage(name: RouteNames.changeFinancialInfo, page:()=>  ChangeFinancialScreen(),binding: ChangeFinancialBinding()),
    GetPage(name: RouteNames.changeNomineeInfo, page:()=>  ChangeNomineeScreen(),binding: ChangeNomineeBinding()),
    GetPage(name: RouteNames.allProject, page:()=>   AllProjectScreen(),binding: AllProjectBinding()),
    GetPage(name: RouteNames.shortTermProject, page:()=>   ShortTermScreen(),binding: ShortTermBinding()),
    GetPage(name: RouteNames.changeMobileBankingInfo, page:()=>   MobileBankingChange(),binding: ChangeBankingBinding()),

  ];
}