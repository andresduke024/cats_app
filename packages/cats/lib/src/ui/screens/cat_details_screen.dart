import 'package:cats/src/models/cat.dart';
import 'package:cats/src/ui/components/cats_scaffold.dart';
import 'package:flutter/material.dart';

class CatDetailsScreen extends StatelessWidget {
  final Cat cat;

  const CatDetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return CatsScaffold(
      body: Center(
        child: Text(cat.breedName),
      ),
    );
  }
}
