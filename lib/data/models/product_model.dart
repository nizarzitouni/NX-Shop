// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<ProductModel> productModelFromJson(String str) {
  return List<ProductModel>.from(
      json.decode(str).map((x) => ProductModel.fromMap(x)));
}

String productModelToJson(List<ProductModel> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
}

class ProductModel {
  final int productId;
  final String productName;
  final double productPrice;
  final String description;
  final Rating productRating;
  final String category;
  final List<String> images;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.description,
    required this.productRating,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'description': description,
      'productRating': productRating.toJson(),
      'category': category,
      'images': images,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    List<String> imagess = List<String>.from(
        (map['images'] as List<dynamic>).map((i) => i.toString()));

    return ProductModel(
      productId: map['productId'] as int,
      productName: map['productName'] as String,
      productPrice: map['productPrice'] as double,
      description: map['description'] as String,
      productRating:
          Rating.fromJson(map['productRating'] as Map<String, dynamic>),
      category: map['category'] as String,
      images: imagess,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class ProductModel {
//   final int id;
//   final String title;
//   final num price;
//   final String description;
//   final String? category;
//   final String image;
//   final Rating rating;
//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     this.category,
//     required this.image,
//     required this.rating,
//   });

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "category": category,
//         "image": image,
//         "rating": rating.toJson(),
//       };

//   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"].toDouble(),
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"]),
//       );

//   static ProductModel fromSnapshot(DocumentSnapshot snap) {
//     ProductModel product = ProductModel(
//       id: snap['id'],
//       title: snap['title'],
//       price: snap['price'],
//       description: snap['description'],
//       category: snap['category'],
//       image: snap['image'],
//       rating: snap['rating'],
//     );

//     return product;
//   }
// }

class Rating {
  final num rate;
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );
  @override
  String toString() => 'Rating(rate: $rate, count: $count)';
}
