import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 18,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          size: size,
          color: color,
        );
      }),
    );
  }
}
