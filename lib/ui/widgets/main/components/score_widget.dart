import 'package:falling_ball_game/sources/app_colors.dart';
import 'package:falling_ball_game/sources/app_strings.dart';
import 'package:falling_ball_game/sources/app_styles.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.tapCount,
    required this.onPressedFast,
    required this.onPressedSlow,
    required this.speed,
  });
  final int tapCount;
  final int speed;
  final VoidCallback onPressedFast;
  final VoidCallback onPressedSlow;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: AppColors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '${AppStrings.score} $tapCount',
                  style: AppStyles.main,
                ),
                Text(
                  'Speed: $speed',
                  style: AppStyles.main,textWidthBasis: TextWidthBasis.parent,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            TextButton(
                onPressed: onPressedFast,
                child: const Text(
                  'Speed+',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: onPressedSlow,
                child: const Text(
                  'Speed-',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
