import 'package:qg_stock_take_app/models/expense_category.dart';

class StationExpenseCategory {
  ExpenseCategory? expenseCategory;

  StationExpenseCategory({
    this.expenseCategory,
  });

  factory StationExpenseCategory.fromJson(Map<String, dynamic> json) =>
      StationExpenseCategory(
        expenseCategory: ExpenseCategory.fromJson(json['expense_category']),
      );

  Map<String, dynamic> toJson() => {
        'expense_category': expenseCategory?.toJson(),
      };
}
