class CustomerId {
  int id;
  String name;

  CustomerId(
    json, {
    required this.id,
    required this.name,
  });

  CustomerId.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
