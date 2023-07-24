// product_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prac_json/controllers/product_controller.dart';
import 'package:prac_json/models/product_model.dart';
import 'package:prac_json/product_details.dart';
class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductController controller = Get.put(ProductController());
  String dropdownvalue = 'All';
  var items = [
  'All',
  'Premium',
  'Tamilnadu',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(

              value: dropdownvalue!,
              onChanged: (String? value) {
                if(value=="All"){
                  controller.filterProductsByCategory("");
                }else {
                  controller.filterProductsByCategory(value!);
                }
                setState(() {
                  dropdownvalue=value!;
                });
              },
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Obx(
                  () => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  ProductModel product = controller.filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ProductDetails(product: product),transition: Transition.fade);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/product_image.png', // Replace with actual product image path.
                            height: MediaQuery.of(context).size.width*.3,
                            width: MediaQuery.of(context).size.width*.6,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.pName),
                                Text(product.pCost.toString()),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text("${product.pDetails}"))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
