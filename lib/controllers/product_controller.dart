// product_controller.dart

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:prac_json/models/product_model.dart';

class ProductController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      String jsonData = await rootBundle.loadString('assets/products.json');
      List<dynamic> parsedJson = jsonDecode(jsonData);
      List<ProductModel> productList =
      parsedJson.map((json) => ProductModel.fromJson(json)).toList();

      products.assignAll(productList);
      filterProductsByCategory('');
    } catch (e) {
      // Handle error loading JSON data.
      print('Error loading JSON data: $e');
    }
  }


  void filterProductsByCategory(String category) {
    if (category.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(products.where((product) =>
      product.pCategory.toLowerCase() == category.toLowerCase()));
    }
    selectedCategory.value = category;
  }
  void updateProductQuantity(ProductModel product, int quantity) {
    int index = products.indexWhere((element) => element.pId == product.pId);
    if (index != -1) {
      products[index].quantity = quantity;
    }
  }
}
