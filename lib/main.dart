import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_page/services.dart';
import 'package:product_list_page/model.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Controller extends GetxController {
  var count = 0.obs;
  List<Product> productList = [];

  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }

  fetchAPI() async {
    await API().getProducts().then((val) => productList = val);
    print(productList);
  }

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
    return Scaffold(
        body: ListView(
      children: [
        for (int i = 0; i < c.productList.length; i++)
          Text(c.productList[i].title)
      ],
    ));
  }
}
