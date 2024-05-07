import 'package:qg_stock_take_app/models/customer_id.dart';

class CreditCustomer {
  CustomerId customerId;
  bool activeState;

  CreditCustomer({
    required this.customerId,
    required this.activeState,
  });

  factory CreditCustomer.fromJson(Map<String, dynamic> json) {
    return CreditCustomer(
      customerId: CustomerId.fromJson(json['id']),
      activeState: json['active_state'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': customerId.toJson(),
        'active_state': activeState,
      };
}
