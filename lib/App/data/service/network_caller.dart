import 'dart:convert';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';

class NetworkUtils {

  Future<http.Response> getProjectsByBusinessType()async{
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";

    String url=api_base_url+"api/client-v1/project_list";

   Map<String,String> headers= {
      "Content-Type": "application/json",
    'Authorization': 'Bearer $token'
    };

   http.Response response= await http.get(Uri.parse(url),headers: headers);
   return response;

  }


  Future<http.Response> getAllSliderImages()async{
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";

    String url=api_base_url+"api/client-v1/slider/";

    Map<String,String> headers= {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response= await http.get(Uri.parse(url),headers: headers);
    return response;

  }


  Future<http.Response> getAllBlog()async{
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";

    String url=api_base_url+"api/client-v1/blog/";

    Map<String,String> headers= {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response= await http.get(Uri.parse(url),headers: headers);
    return response;

  }



  /// Get request
  Future<dynamic> getMethod(String url) async {
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";
    try {
      final http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },

      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }

      else {
        log("Something went wrong");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Post request
  Future<http.Response> profilepostMethod({Map<String, String>? body1}) async {



    String url="https://agro.smartbiniyog.com/api/client-v1/update-profile";
    String token="49|l1Wi5Z2ah7KZS1mCsyI9tuZbslHGDtVAoSUXEmG4c99f4b04";
    Map<String,String> headers= {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

    http.Response response=await http.post(Uri.parse(url),headers: headers,body: json.encode(body1));
    return response;


  }








  Future<dynamic> authPostMethod(String url, {Map<String, String>? body}) async {
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";
    try {
      final http.Response response = await http.post(Uri.parse(url),

          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(body));
     // log(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } //else if (response.statusCode == 401) {
      //   if (onUnAuthorize != null) {
      //     onUnAuthorize();
      //   } else {
      //     moveToLogin();
      //   }
      else {
        log("Something went wrong ${response.statusCode}");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  Future<dynamic> PostMethod(String url, {Map<String, String>? body}) async {
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";
    try {
      final http.Response response = await http.post(Uri.parse(url),

          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(body));
      log(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } //else if (response.statusCode == 401) {
      //   if (onUnAuthorize != null) {
      //     onUnAuthorize();
      //   } else {
      //     moveToLogin();
      //   }
      else {
        log("Something went wrong ${response.statusCode}");
      }
    } catch (e) {
      log('Error $e');
    }
  }




}