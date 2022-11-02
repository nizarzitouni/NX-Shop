import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nx_shop/data/models/product_modle.dart';
import 'package:nx_shop/core/my_strings.dart';

class ProductService {
  //
  static List<ProductModel> parseProducts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ProductModel>(
            (jsonProductModel) => ProductModel.fromJson(jsonProductModel))
        .toList();
  }

  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      // String allProductAsJsonData = response.body;
      return compute(parseProducts, response.body);
      // return parseProducts(response.body);
    } else {
      return throw Exception('----------Fail To Load Products-----------');
    }
  }
}
