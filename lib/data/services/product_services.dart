import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nx_shop/data/models/product_model.dart';
import 'package:nx_shop/core/my_strings.dart';

class ProductService {
  static Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      // String allProductAsJsonData = response.body;
      return compute(productModelFromJson, response.body);
      // return parseProducts(response.body);
    } else {
      return throw Exception('----------Fail To Load Products-----------');
    }
  }
}
