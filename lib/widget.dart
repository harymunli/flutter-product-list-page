import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:product_list_page/controller.dart';

class ProductCard extends StatelessWidget {
  final String title, price, desc, rating;

  ProductCard(this.title, this.price, this.desc, this.rating);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller(context));

    return Card(
      borderOnForeground: true,
      color: Color(0xFFC4C4C4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: c.useTabletLayout() ? 20 : 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(
                  minHeight: c.deviceHeight() * 0.2,
                  minWidth: c.deviceWidth() * 0.25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)),
              child: Text("\$ " + price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: c.useTabletLayout() ? 24 : 16,
                      fontFamily: "Inter"))),
        ),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(
                  minHeight: c.deviceHeight() * 0.2,
                  minWidth: c.deviceWidth() * 0.25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xFFFFFFFF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: c.useTabletLayout() ? 15 : 12,
                          fontFamily: "Inter")),
                  SizedBox(height: 8),
                  Text(desc,
                      style: TextStyle(fontSize: 10, fontFamily: "Inter")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        IconData(0xe5f9, fontFamily: 'MaterialIcons'),
                        size: 12,
                      ),
                      Text(" " + rating,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: c.useTabletLayout() ? 13 : 10,
                              fontFamily: "Inter"))
                    ],
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
