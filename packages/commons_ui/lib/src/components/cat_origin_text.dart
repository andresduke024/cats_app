import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';

class CatOriginText extends StatelessWidget {
  final String origin;

  const CatOriginText({super.key, required this.origin});

  @override
  Widget build(BuildContext context) {
    return EllipsisText(
      text: "Origin: $origin",
      style: TextStyle(color: Theme.of(context).primaryColor),
      maxLines: 2,
    );
  }
}
