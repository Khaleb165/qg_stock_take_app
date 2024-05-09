import 'tank.dart';

class TankGroup {
  int id;
  String name;
  int productId;
  final List<Tank> tank;

  TankGroup({
    required this.id,
    required this.name,
    required this.productId,
    required this.tank,
  });

  factory TankGroup.fromJson(Map<String, dynamic> json) {
    return TankGroup(
      id: json['id'],
      name: json['name'],
      productId: json['product_id'],
      tank: List<Tank>.from(json['tank'].map((x) => Tank.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'product_id': productId,
        'tank': List<dynamic>.from(tank.map((x) => x.toJson())),
      };
}
