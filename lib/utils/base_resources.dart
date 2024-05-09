enum BaseResources {
  splash(name: "splash.png"),
  catsPackageImage(name: "cats_package.png"),
  favoritesCatsPackageImage(name: "favorites_cats_package.png"),
  adoptCatsPackageImage(name: "adopt_cats_package.png");

  final String value;

  const BaseResources({required String name}) : value = "assets/images/$name";
}
