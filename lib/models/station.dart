class Station {
  int? id;
  String? name;

  Station({this.id, this.name});

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
