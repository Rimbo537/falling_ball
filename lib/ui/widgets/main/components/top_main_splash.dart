import 'package:falling_ball_game/sources/app_strings.dart';
import 'package:falling_ball_game/sources/app_styles.dart';
import 'package:flutter/material.dart';

class TopMainSplashWidget extends StatelessWidget {
  const TopMainSplashWidget({
    super.key,
    required this.topMainSplash,
    required this.failGame,
  });

  final bool topMainSplash;
  final bool failGame;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: topMainSplash,
      child: Column(
        children: [
          const SizedBox(height: 130),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              failGame ? AppStrings.fail : AppStrings.tapToPlay,
              style: AppStyles.main,
            ),
          ),
        ],
      ),
    );
  }
}
