import 'package:flutter/material.dart';
import 'package:starwars_movie_app/config/themes/app_textstyle.dart';
import 'package:starwars_movie_app/utils/convert_date.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
    required this.title,
    this.onTap,
    this.releaseDate,
    required this.episode,
  });

  final String title;
  final DateTime? releaseDate;
  final String episode;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: [
          Text.rich(
            TextSpan(
              text: title,
              children: [
                TextSpan(
                    text: releaseDate != null
                        ? ' (${ConvertDate.convertYear(releaseDate)})'
                        : '')
              ],
              style: AppTextstyle.subtitleTextStyle,
            ),
          ),
        ],
      ),
      subtitle: Text('$episode Episode'),
    );
  }
}
