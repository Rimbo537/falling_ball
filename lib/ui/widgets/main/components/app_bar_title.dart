import 'package:falling_ball_game/sources/app_strings.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(AppStrings.fallingBall),
    );
  }
}
