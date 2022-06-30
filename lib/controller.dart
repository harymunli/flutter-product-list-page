import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_list_page/service.dart';
import 'package:product_list_page/model.dart';

class Controller extends GetxController {
  late BuildContext context;
  List<Product> productList = [];

  // //const number for mobile
  // var spaceBetweenCard = 10.obs;
  // //fs = Font Size
  // var fsPrice = 16.obs;
  // var fsTitle = 12.obs;
  // var fsDesc = 10.obs;

  Controller(this.context);
  // this.spaceBetweenCard.value = 20;
  // this.fsPrice.value = 24;
  // this.fsTitle.value = 15;
  // this.fsDesc.value = 13;

  @override
  void onInit() {
    super.onInit();
    fetchAPI();
  }

  fetchAPI() async {
    await API().getProducts().then((val) => productList = val);
  }

  //makai function gak makai variable supaya selalu update datanya
  //untuk case : preview device_preview dependency , dan landscape
  double deviceWidth() => MediaQuery.of(context).size.width;
  double deviceHeight() => MediaQuery.of(context).size.height;
  bool useTabletLayout() => MediaQuery.of(context).size.shortestSide > 600;
  double dynamicWidthPadding() =>
      useTabletLayout() ? deviceWidth() * 0.15 : deviceWidth() * 0.05;
}
