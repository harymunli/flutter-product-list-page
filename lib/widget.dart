import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title, price, desc, rating;

  ProductCard(this.title, this.price, this.desc, this.rating);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Color(0xFFC4C4C4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)),
              child: Text(price)),
        ),
        Expanded(
          flex: 2,
          child: Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Color(0xFFFFFFFF)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(desc),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("icon"), Text(rating)],
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
