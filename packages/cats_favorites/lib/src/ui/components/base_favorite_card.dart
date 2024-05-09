import 'package:flutter/material.dart';

final class BaseFavoriteCard extends StatelessWidget {
  final List<Widget> children;

  const BaseFavoriteCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 20;

    return Material(
      elevation: 4.0,
      shadowColor: Theme.of(context).primaryColor,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
