enum CatDetailsPackageRoutes {
  undefined(value: "");

  final String value;

  const CatDetailsPackageRoutes({required this.value});

  factory CatDetailsPackageRoutes.init({required String route}) =>
      values.firstWhere(((e) => e.value == route), orElse: () => CatDetailsPackageRoutes.undefined);
}
