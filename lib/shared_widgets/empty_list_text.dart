import 'package:flutter/material.dart';

class EmptyListText extends StatelessWidget {
  const EmptyListText({
    super.key,
    required this.text,
    this.height = 200,
  });

  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.description_rounded,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
