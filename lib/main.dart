import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class API extends GetConnect {
  Future<String> getProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print("Status code: " + response.statusCode.toString());
      print(response.body);

      return "Error";
    }
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  var json = "loading".obs;

  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }

  fetchAPI() async => await API().getProducts().then((val) => json.value = val);
  increment() => count++;
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  @override
  Widget build(context) {
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.json}")));
  }
}
