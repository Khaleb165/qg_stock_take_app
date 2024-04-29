class LoginModel {
  String phoneNumber;
  String stationCode;

  LoginModel({required this.phoneNumber, required this.stationCode});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        phoneNumber: json['phone_param'],
        stationCode: json['code_param'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_param'] = phoneNumber;
    data['code_param'] = stationCode;
    return data;
  }
}
