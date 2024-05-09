enum CatsFavoritesPackageRoutes {
  undefined(value: "");

  final String value;

  const CatsFavoritesPackageRoutes({required this.value});

  factory CatsFavoritesPackageRoutes.init({required String route}) =>
      values.firstWhere(((e) => e.value == route), orElse: () => CatsFavoritesPackageRoutes.undefined);
}
