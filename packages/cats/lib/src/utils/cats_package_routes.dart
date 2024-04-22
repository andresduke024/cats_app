enum CatsPackageRoutes {
  undefined(value: ""),
  listScreen(value: "cats-lists-screen"),
  detailScreen(value: "cats-details-screen");

  final String value;

  const CatsPackageRoutes({required this.value});

  factory CatsPackageRoutes.init({required String route}) =>
      values.firstWhere(((e) => e.value == route), orElse: () => CatsPackageRoutes.undefined);
}
