// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String? category;
  final String image;
  final Rating rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] != null ? map['category'] as String : null,
      image: map['image'] as String,
      rating: Rating.fromMap(map['rating'] as Map<String, dynamic>),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory ProductModel.fromJson(String source) =>
  //     ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Rating {
  final num rate;
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: map['rate'] as num,
      count: map['count'] as int,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rating(rate: $rate, count: $count)';
}
