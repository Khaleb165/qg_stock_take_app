class Nozzle {
  int id;
  String name;
  int? productId;
  bool activeState;
  int tankGroupId;

  Nozzle(
      {required this.id,
      required this.name,
      this.productId,
      required this.activeState,
      required this.tankGroupId});

  factory Nozzle.fromJson(Map<String, dynamic> json) {
    return Nozzle(
      id: json['id'],
      name: json['name'],
      productId: json['product_id'],
      activeState: json['active_state'],
      tankGroupId: json['tank_group_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'product_id': productId,
        'active_state': activeState,
        'tank_group_id': tankGroupId,
      };
}
