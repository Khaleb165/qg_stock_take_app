class StationReport {
  final int id;
  final DateTime date;

  StationReport({
    required this.id,
    required this.date,
  });

  factory StationReport.fromJson(Map<String, dynamic> json) => StationReport(
        id: json["id"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
