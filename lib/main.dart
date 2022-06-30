import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_list_page/widget.dart';
import 'package:product_list_page/controller.dart';

void main() {
  runApp(GetMaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller(context));

    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(c.dynamicWidthPadding(),
              c.deviceHeight() * 0.1, c.dynamicWidthPadding(), 10),
          children: [
            for (int i = 0; i < c.productList.length; i++)
              ProductCard(c.productList[i].title, c.productList[i].price,
                  c.productList[i].description, c.productList[i].rating.rate)
          ],
        ));
  }
}
