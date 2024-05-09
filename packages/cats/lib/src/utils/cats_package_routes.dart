enum CatsPackageRoutes {
  undefined(value: ""),
  listScreen(value: "cats-lists-screen");

  final String value;

  const CatsPackageRoutes({required this.value});

  factory CatsPackageRoutes.init({required String route}) =>
      values.firstWhere(((e) => e.value == route), orElse: () => CatsPackageRoutes.undefined);
}
