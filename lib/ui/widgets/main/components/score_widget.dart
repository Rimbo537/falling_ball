import 'package:falling_ball_game/sources/app_colors.dart';
import 'package:falling_ball_game/sources/app_strings.dart';
import 'package:falling_ball_game/sources/app_styles.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.tapCount,
  });
  final int tapCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: AppColors.grey,
        child: Center(
          child: Text(
            '${AppStrings.score} $tapCount',
            style: AppStyles.main,
          ),
        ),
      ),
    );
  }
}
