import 'package:commons/commons.dart';
import 'package:commons_ui/src/utils/common_resources.dart';
import 'package:flutter/material.dart';

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
    CommonResources resource;

    switch (cat.weightScale) {
      case 1:
        resource = CommonResources.cat1;
      case 2:
        resource = CommonResources.cat2;
      case 3:
        resource = CommonResources.cat3;
      case 4:
        resource = CommonResources.cat4;
      case 5:
        resource = CommonResources.cat5;
      case 6:
        resource = CommonResources.cat6;
      case 7:
        resource = CommonResources.cat7;
      default:
        resource = CommonResources.cat1;
    }

    return AssetImage(resource.value);
  }
}
