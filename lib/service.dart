import 'package:http/http.dart' as http;
import 'package:product_list_page/model.dart';

class API {
  Future<List<Product>> getProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return productResponseFromJSON(response.body);
    } else {
      print("Status code: " + response.statusCode.toString());
      print(response.body);

      return [];
    }
  }
}
