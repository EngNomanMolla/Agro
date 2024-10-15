import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:smart_biniyog/App/constant/base_url.dart';
import 'package:smart_biniyog/App/data/model/dashboard_model.dart';
import 'package:smart_biniyog/App/data/service/data_saver.dart';
import 'package:smart_biniyog/App/data/urls/urls.dart';

class NetworkUtils {
  Future<http.Response> getProjectsByBusinessType() async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();

    String url = api_base_url + "api/client-v1/project_list";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  Future<http.Response> getAllSliderImages() async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();

    String url = api_base_url + "api/client-v1/slider/";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return response;
  }

  Future<http.Response> getAllBlog() async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();

    String url = api_base_url + "api/client-v1/blog/";

    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    getDashboardData();
    return response;
  }

  Future<DashboardModel> getDashboardData() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    http.Response response =
        await http.get(Uri.parse(Urls.dashboard), headers: headers);

    return dashboardModelFromJson(response.body);
  }

  Future<http.Response> getProjects({String? categoryID}) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    http.Response response = await http.get(
        Uri.parse(categoryID == null
            ? Urls.allprojecturl
            : '${Urls.allprojecturl}/$categoryID'),
        headers: headers);

    return response;
  }

  Future<http.Response> getMyFarm() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${await AuthUtils.getAuthData()}',
    };

    http.Response response =
        await http.get(Uri.parse(Urls.myFarm), headers: headers);

    return response;
  }

  Future<http.Response> updatePersonalInfo({Map? personalInfo}) async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${await AuthUtils.getAuthData()}',
    };

    http.Response response = await http.post(
      Uri.parse(Urls.updateprofileurl),
      headers: headers,
      body: jsonEncode(personalInfo)
    );

    return response;
  }

  /// Get request
  Future<dynamic> getMethod(String url) async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();
    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        log("Something went wrong");
      }
    } catch (e) {
      log('Error $e');
    }
  }

  /// Post request
  Future<http.Response> profilepostMethod({Map<String, String>? body1}) async {
    String url = "https://agro.smartbiniyog.com/api/client-v1/update-profile";
    String token = 'Bearer ' + await AuthUtils.getAuthData();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

    http.Response response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(body1));
    return response;
  }

  Future<dynamic> authPostMethod(String url,
      {Map<String, String>? body}) async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();
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
        return false;
      }
    } catch (e) {
      log('Error $e');
      return false;
    }
  }

  Future<dynamic> PostMethod(String url, {Map<String, String>? body}) async {
    String token = 'Bearer ' + await AuthUtils.getAuthData();
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
