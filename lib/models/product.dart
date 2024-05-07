class ProductId {
  int productId;
  String name;

  ProductId({
    required this.productId,
    required this.name,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) {
    return ProductId(
      productId: json['product_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'name': name,
      };
}
