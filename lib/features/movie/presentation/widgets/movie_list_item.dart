import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(title),
    );
  }
}
