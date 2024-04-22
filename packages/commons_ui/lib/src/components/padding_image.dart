import 'package:flutter/material.dart';

class PaddingImage extends StatelessWidget {
  final String assetName;
  final EdgeInsetsGeometry padding;
  final BoxFit fit;

  const PaddingImage({
    super.key,
    required this.assetName,
    this.padding = EdgeInsets.zero,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetName),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
