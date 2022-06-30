import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_list_page/service.dart';
import 'package:product_list_page/model.dart';

class Controller extends GetxController {
  late BuildContext context;
  List<Product> productList = [];
  List<Product> showedProductList = [];
  ScrollController scrollController = ScrollController();
  int listLength = 4;

  Controller(this.context);

  @override
  void onInit() {
    fetchAPI();
    addItems();
    super.onInit();
  }

  fetchAPI() async {
    await API().getProducts().then((val) {
      productList = val;
      showedProductList = val.take(4).toList();
    });
  }

  addItems() async {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        await Future.delayed(Duration(milliseconds: 500));
        showedProductList
            .addAll(productList.getRange(listLength, listLength + 4));
        listLength += 4;
        update();
      }
    });
  }

  //makai function gak makai variable supaya selalu update datanya
  //untuk case : preview device_preview dependency , dan landscape
  double deviceWidth() => MediaQuery.of(context).size.width;
  double deviceHeight() => MediaQuery.of(context).size.height;
  bool useTabletLayout() => MediaQuery.of(context).size.shortestSide > 600;
  double dynamicWidthPadding() =>
      useTabletLayout() ? deviceWidth() * 0.15 : deviceWidth() * 0.05;
}
