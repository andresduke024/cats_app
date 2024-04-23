import 'package:flutter/material.dart';

class CatOriginText extends StatelessWidget {
  final String origin;

  const CatOriginText({super.key, required this.origin});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Origin: $origin",
      style: TextStyle(color: Theme.of(context).primaryColor),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      softWrap: false,
    );
  }
}
