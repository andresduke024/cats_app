import 'package:flutter/material.dart';

class GenericAssetImage extends StatelessWidget {
  final String resourceName;
  const GenericAssetImage({
    super.key,
    required this.resourceName,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image(
      image: AssetImage(resourceName),
      width: size.width,
      fit: BoxFit.contain,
    );
  }
}
