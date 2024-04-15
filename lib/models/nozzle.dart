class Nozzle {
  int id;
  String nozzleName;
  int productId;
  bool activeState;
  int tankGroupId;

  Nozzle(
      {required this.id,
      required this.nozzleName,
      required this.productId,
      required this.activeState,
      required this.tankGroupId});
}
