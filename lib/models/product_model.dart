// product_model.dart

class ProductModel {
  int pId;
  String pName;
  double pCost;
  int pAvailability;
  String pDetails;
  String pCategory;
  int quantity;

  ProductModel({
    required this.pId,
    required this.pName,
    required this.pCost,
    required this.pAvailability,
    required this.pDetails,
    required this.pCategory,
    this.quantity = 1,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      pId: json['p_id'],
      pName: json['p_name'],
      pCost: json['p_cost'].toDouble(),
      pAvailability: json['p_availability'],
      pDetails: json['p_details'] ?? '',
      pCategory: json['p_category'] ?? 'Uncategorized',
      quantity: json['p_quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_id': pId,
      'p_name': pName,
      'p_cost': pCost,
      'p_availability': pAvailability,
      'p_details': pDetails,
      'p_category': pCategory,
      'p_quantity': quantity,
    };
  }
}
