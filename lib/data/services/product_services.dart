import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:nx_shop/core/constants.dart';
import 'package:nx_shop/data/models/product_model.dart';
import 'package:nx_shop/core/my_strings.dart';

class ProductService {
  //Getting dump Data from api
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

  //~~~~~~~~~~~~~~Firebase Data~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  static Stream<List<ProductModel>> productStream() {
    List<ProductModel> products = [];

    try {
      return firebaseFirestore
          .collection('products')
          .snapshots()
          .map((QuerySnapshot query) {
        for (var product in query.docs) {
          products.add(
            ProductModel.fromJson(product.data() as Map<String, dynamic>),
          );
        }
        debugPrint(
            '------------------ffffffffff----$products ----------------------');
        return products;
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
