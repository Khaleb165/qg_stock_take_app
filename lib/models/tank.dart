class Tank {
  int id;
  String name;
  int tankGroupId;
  bool activeState;

  Tank({
    required this.id,
    required this.name,
    required this.tankGroupId,
    required this.activeState,
  });

  factory Tank.fromJson(Map<String, dynamic> json) {
    return Tank(
      id: json['id'],
      name: json['name'],
      tankGroupId: json['tank_group_id'],
      activeState: json['active_state'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tank_group_id': tankGroupId,
        'active_state': activeState,
      };
}
