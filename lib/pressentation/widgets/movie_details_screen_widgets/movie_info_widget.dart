import 'package:flutter/material.dart';
import 'package:movieapptask/config/app_colors.dart';

class MovieInfo extends StatelessWidget {
  final String title, value;

  MovieInfo(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: AppColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: AppColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
