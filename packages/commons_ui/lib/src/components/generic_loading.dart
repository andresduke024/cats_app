import 'package:flutter/material.dart';

class GenericLoading extends StatelessWidget {
  const GenericLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
