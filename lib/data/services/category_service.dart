import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nx_shop/data/models/category_model.dart';
import 'package:nx_shop/core/my_strings.dart';

import '../models/product_model.dart';

class CategoryService {
  static Future<List<String>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      // String allCategories as json= response.body;
      // debugPrint(
      //     '----------------------getCategories() response.statusCode == 200 ----------------------');
      return compute(categoryModelFromJson, response.body);
    } else {
      return throw Exception('----------Fail To Load Categories-----------');
    }
  }

  static Future<List<ProductModel>> getProductsByCategory(String cat) async {
    final response =
        await http.get(Uri.parse('$baseUrl/products/category/$cat'));
    // debugPrint(
    //     '----------------------response response $response ----------------------');
    if (response.statusCode == 200) {
      return compute(productModelFromJson, response.body);
      // return parseProducts(response.body);
    } else {
      return throw Exception('----------Fail To Load Products-----------');
    }
  }
}
