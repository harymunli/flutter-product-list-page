import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_list_page/service.dart';
import 'package:product_list_page/model.dart';
import 'package:product_list_page/widget.dart';

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
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
          children: [
            for (int i = 0; i < c.productList.length; i++)
              ProductCard(c.productList[i].title, c.productList[i].price,
                  c.productList[i].description, c.productList[i].rating.rate)
          ],
        ));
    //       Container(
    //           padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
    //           child: ProductCard()));
  }
}
