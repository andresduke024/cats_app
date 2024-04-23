import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final Widget ratingImage;
  final int rating;
  final String text;

  const RatingBar({
    super.key,
    required this.ratingImage,
    required this.rating,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const double size = 22;

    final image = Padding(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        height: size,
        width: size,
        child: ratingImage,
      ),
    );

    final ratingWidgets = List.filled(rating, image);

    return Row(
      children: [
        Text(
          "$text: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: ratingWidgets,
        ),
      ],
    );
  }
}
