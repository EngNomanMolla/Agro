import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:smart_biniyog/App/data/model/product_model.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/routes/route_destinations.dart';
import 'package:smart_biniyog/App/routes/route_names.dart';
import 'package:hive_flutter/hive_flutter.dart';

//comment
void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter()); // Register adapter
  await Hive.openBox<ProductModel>('products');

  await AuthUtils.checkLoginState();

  runApp(

    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart_biniyog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     getPages: RouteDestinations.pages,
      initialRoute: RouteNames.dashBoard,



    // home: DateDifferenceScreen(),       //
      //        DashBoardScreen(),
    );
  }
}
