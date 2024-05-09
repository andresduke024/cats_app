import 'package:flutter/material.dart';

final class EllipsisText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;

  const EllipsisText({
    super.key,
    required this.text,
    this.maxLines = 1,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      softWrap: false,
    );
  }
}
