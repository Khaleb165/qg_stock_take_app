class ExpenseCategory {
  int? id;
  String? name;

  ExpenseCategory({
    this.id,
    this.name,
  });

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      ExpenseCategory(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
