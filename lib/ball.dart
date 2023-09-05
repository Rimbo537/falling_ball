import 'package:falling_ball_game/sources/app_styles.dart';
import 'package:flutter/material.dart';

class MyBall extends StatelessWidget {
  const MyBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: AppStyles.ballDecoration,
    );
  }
}
