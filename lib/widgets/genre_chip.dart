import 'package:flutter/material.dart';
import 'package:watt/watt.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = Palette.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: palette.primary,
      ),
      child: Text(
        title,
        style: TextStyle(color: palette.white),
      ),
    );
  }
}
