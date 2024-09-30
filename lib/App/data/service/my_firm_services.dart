
import 'package:http/http.dart' as http;
import 'package:smart_biniyog/App/constant/base_url.dart';
class MyFirmService{

  Future<http.Response> getMyFirms()async{
    String token="53|pRq1MiXNh0Ja8pHjWhYfj37CJ4b7MZSXr08NWTwCead8a176";

    String url= api_base_url+"api/client-v1/blog/";

    Map<String,String> headers= {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    };

    http.Response response= await http.get(Uri.parse(url),headers: headers);
    return response;
  }


}