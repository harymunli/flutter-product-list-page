import 'dart:convert';

class Product {
  final String id, title, price, description, category, image;
  final Rating rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"].toString(),
        title: json["title"],
        price: json["price"].toString(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]));
  }
}

class Rating {
  final String rate, count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json["rate"].toString(), count: json["count"].toString());
  }
}

List<Product> productResponseFromJSON(String str) {
  List<dynamic> temp = json.decode(str);
  return List<Product>.from(temp.map((x) => Product.fromJson(x)));
}
