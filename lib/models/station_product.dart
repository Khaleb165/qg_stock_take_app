import 'package:qg_stock_take_app/models/product.dart';

class StationProduct {
  final ProductId productId;

  StationProduct({required this.productId});

  factory StationProduct.fromJson(Map<String, dynamic> json) {
    return StationProduct(
      productId: ProductId.fromJson(json['product_id']),
    );
  }

  Map<String, dynamic> toJson() => {
        'product_id': productId.toJson(),
      };
}
