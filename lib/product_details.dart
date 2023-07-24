import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prac_json/controllers/product_controller.dart';
import 'package:prac_json/models/product_model.dart';
import 'package:get/get.dart';
class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({Key? key,
  required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductController controller = Get.put(ProductController());
  int _n = 0;
  void add() {
    setState(() {
      _n++;
    });
  }
  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       margin: EdgeInsets.all(10),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Image.asset(
         'assets/product_image.png',
         ),
           Text(widget.product.pName),
           Text(widget.product.pCost.toString()),
           Text(widget.product.pDetails)
         ],
       ),
     ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: add,
              child: new Icon(Icons.add, color: Colors.black,),
              backgroundColor: Colors.white,),
SizedBox(width: 20,),
            new Text('$_n',
                style: new TextStyle(fontSize: 60.0)),
            SizedBox(width: 20,),

            new FloatingActionButton(
              onPressed: minus,
              child: new Icon(Icons.remove, color: Colors.black,),
              backgroundColor: Colors.white,),
            SizedBox(width: 100,),
            ElevatedButton(
              onPressed: () {
                controller.updateProductQuantity(widget.product, _n);
                _showSubmitDialog(widget.product.toJson());
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      );

  }
  void _showSubmitDialog(Map<String,dynamic> products) {
    String jsonString = jsonEncode(products);
    showDialog(
      context: Get.overlayContext!,
      builder: (context) {
        return AlertDialog(
          title: Text('Submitted JSON'),
          content: Text(jsonString),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
