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
