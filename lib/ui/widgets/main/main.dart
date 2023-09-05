import 'dart:async';

import 'package:falling_ball_game/ball.dart';
import 'package:falling_ball_game/sources/app_strings.dart';
import 'package:falling_ball_game/ui/widgets/main/components/app_bar_title.dart';
import 'package:falling_ball_game/ui/widgets/main/components/score_widget.dart';
import 'package:falling_ball_game/ui/widgets/main/components/top_main_splash.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  static double ballY = 0; // Начальная позиция шара
  double ballSpeed = 0.015; // Скорость шара
  bool isMovingUp = true; // Направления движения
  int tapCount = 0; // Счетчик нажатий
  bool topMainSplash = true; // Отображение надписи tap to play / fail
  bool gameIsStarted = true; // Условие для запуска таймера и начала движения
  bool counter = true; // вкл/откл счетчика
  bool failGame = false; // // Отображение надписи Fail
  bool isRestart = false;
  int speed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.restart_alt),
            tooltip: AppStrings.restartButton,
            onPressed: restartGame,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: Stack(
                children: [
                  TopMainSplashWidget(
                    failGame: failGame,
                    topMainSplash: topMainSplash,
                  ),
                  AnimatedContainer(
                    alignment: Alignment(0, ballY),
                    duration: const Duration(microseconds: 0),
                    child: const MyBall(),
                  ),
                ],
              ),
            ),
          ),
          ScoreWidget(
            speed: speed,
            tapCount: tapCount,
            onPressedFast: () {
              setState(() {
                ballSpeed += 0.01;
                speed += 1;
              });
            },
            onPressedSlow: () {
              setState(() {
                ballSpeed -= 0.01;
                speed -= 1;
              });
            },
          ),
        ],
      ),
    );
  }

  void onTap() {
    if (gameIsStarted) {
      startGame();
    }
    if (!failGame) {
      setState(() {
        isMovingUp = !isMovingUp;
        topMainSplash = false;
        gameIsStarted = false;
        isRestart = false;
        counter = true;
        if (counter) tapCount++;
      });
    }
  }

  void startGame() {
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (isRestart) {
        timer.cancel();
        setState(() {
          counter = false;
          topMainSplash = true;
        });
      }
      if (ballY > 1 || ballY < -1) {
        timer.cancel();
        setState(() {
          counter = false;
          failGame = true;
          topMainSplash = true;
        });
      }
      setState(() {
        if (isMovingUp == true) {
          ballY -= ballSpeed;
        } else {
          ballY += ballSpeed;
        }
      });
    });
  }

  void restartGame() {
    setState(() {
      ballY = 0;
      topMainSplash = true;
      gameIsStarted = true;
      isMovingUp = true;
      tapCount = 0;
      counter = true;
      failGame = false;
      isRestart = true;
    });
  }
}
