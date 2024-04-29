class Bank {
  int bankId;
  String bankName;

  Bank({required this.bankId, required this.bankName});

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        bankId: json["bank_id"],
        bankName: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "bank_id": bankId,
        "name": bankName,
      };
}
