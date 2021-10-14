import 'package:http/http.dart' as http;
import 'package:squareone_sam/models/product.dart';
class RemoteServices {
  static var client = http.Client();
  static const API ="http://192.168.6.75/ordersapi/api/";

  static Future fetchProducts() async {
    var response = await client.get(Uri.parse(
        API+'productstree'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      //show error message
      print("Failed");
      return null;
    }
  }
}
