import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_biniyog/App/modules/screens/mbanking/controller/controller_page.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';

class MobileBanking extends StatefulWidget {
  const MobileBanking({Key? key}) : super(key: key);

  @override
  State<MobileBanking> createState() => _MobileBankingState();
}

class _MobileBankingState extends State<MobileBanking> {


  MobileBankingController mobileBankingController=Get.put(MobileBankingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GetBuilder<MobileBankingController>(builder: (MobileBankingController) {
      return MobileBankingController.getpersonInfoProgress
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : RefreshIndicator(
        onRefresh: () async {
          MobileBankingController.GetPersonInfoModel();
        },
        child: Column(
        children: [

          ListTile(
            title: Text('Mobile Banking Informaion',style:TextStyle(fontWeight:FontWeight.bold)),
            trailing: TextButton(onPressed: () {

              Get.toNamed(RouteNames.changeMobileBankingInfo);


            }, child: Text('Change'),),

          ),

          SizedBox(
            height: 3,
          ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                  // height: 310,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text(' ${MobileBankingController.personInfoDataModel.client!.mfs?.mfsName}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'Account Name:',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text(' ${MobileBankingController.personInfoDataModel.client!.mfs?.mfsType}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          'Account branch',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      ListTile(
                        iconColor: Colors.black,
                        trailing: Text('${MobileBankingController.personInfoDataModel.client!.mfs?.mfsNumber}', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),),
                        title: Text(
                          ' Phone Num ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
            ),






        ],
      ),
    );
    }),

    );
  }
}
