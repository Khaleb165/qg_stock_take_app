class StationExpenseAuth {
  bool activeState;

  StationExpenseAuth({
    required this.activeState,
  });

  factory StationExpenseAuth.fromJson(Map<String, dynamic> json) =>
      StationExpenseAuth(
        activeState: json['active_state'],
      );

  Map<String, dynamic> toJson() => {
        'active_state': activeState,
      };
}
