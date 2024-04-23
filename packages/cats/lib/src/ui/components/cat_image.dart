import 'package:cats/src/models/cat.dart';
import 'package:flutter/material.dart';

import '../../utils/cats_package_resources.dart';

class CatImage extends StatelessWidget {
  final Cat cat;

  const CatImage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: _getAsset(),
    );
  }

  AssetImage _getAsset() {
    CatsPackageResources resource;

    switch (cat.weightScale) {
      case 1:
        resource = CatsPackageResources.cat1;
      case 2:
        resource = CatsPackageResources.cat2;
      case 3:
        resource = CatsPackageResources.cat3;
      case 4:
        resource = CatsPackageResources.cat4;
      case 5:
        resource = CatsPackageResources.cat5;
      case 6:
        resource = CatsPackageResources.cat6;
      case 7:
        resource = CatsPackageResources.cat7;
      default:
        resource = CatsPackageResources.cat1;
    }

    return AssetImage(resource.value);
  }
}
