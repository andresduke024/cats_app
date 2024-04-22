enum CommonRoutes {
  catsPackage(value: "cats_package"),
  favoriteCatsPackages(value: "favorite_cats_package");

  final String value;

  const CommonRoutes({required this.value});
}
