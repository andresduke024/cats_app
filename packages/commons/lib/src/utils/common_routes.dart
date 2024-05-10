enum CommonRoutes {
  error(value: ""),
  splash(value: "splash"),
  home(value: "home"),
  catsPackage(value: "cats_package"),
  favoriteCatsPackages(value: "favorite_cats_package"),
  catDetailsPackage(value: "cat_details_package"),
  adoptCatsPackage(value: "adopt_cats_package");

  final String value;

  static String root = "/";

  const CommonRoutes({required this.value});

  factory CommonRoutes.init({required String value}) =>
      values.firstWhere(((e) => e.value == value), orElse: () => CommonRoutes.error);
}
