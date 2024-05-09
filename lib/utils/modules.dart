import 'package:cats_app/utils/base_resources.dart';
import 'package:commons/commons.dart';

enum Module {
  cats(
    description: "Cats list",
    route: CommonRoutes.catsPackage,
    relatedImage: BaseResources.catsPackageImage,
  ),

  favoriteCats(
    description: "Favorite Cats list",
    route: CommonRoutes.favoriteCatsPackages,
    relatedImage: BaseResources.favoritesCatsPackageImage,
  ),

  adoptCats(
    description: "Adopt Cats",
    route: CommonRoutes.adoptCatsPackage,
    relatedImage: BaseResources.adoptCatsPackageImage,
  );

  final String description;
  final CommonRoutes route;
  final BaseResources relatedImage;

  const Module({
    required this.description,
    required this.route,
    required this.relatedImage,
  });
}
