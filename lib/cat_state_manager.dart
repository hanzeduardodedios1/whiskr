import 'package:flutter/material.dart';
import 'package:flame/widgets.dart';
import 'package:flame/components.dart';
import 'models/cats.dart';

// A base class for our cat sprites, ensures they are fitted and are animated correctly.
class CatSpriteBase extends StatelessWidget {
  final String assetPath;
  final int frames;
  final double speed;
  final double frameWidth;
  final double frameHeight;

  const CatSpriteBase({
    super.key,
    required this.assetPath,
    required this.frames,
    required this.frameWidth,
    required this.frameHeight,
    this.speed = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, 
      height: 150,
      child: SpriteAnimationWidget.asset(
        path: assetPath,
        data: SpriteAnimationData.sequenced(
          amount: frames,
          stepTime: speed,
          textureSize: Vector2(frameWidth, frameHeight), 
        ),
      ),
    );
  }
}

class CatBehaviorManager extends StatelessWidget {
  final double currentMinutes;
  final double totalMinutes;
  final bool isTimerRunning;

  const CatBehaviorManager({
    super.key,
    required this.currentMinutes,
    required this.totalMinutes,
    required this.isTimerRunning,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate how much time is left as a percentage (1.0 to 0.0)
    double progress = currentMinutes / totalMinutes;

    // STATE 1: Timer Finished (Celebration)
    if (currentMinutes <= 0) {
      return const CatJump();
    }

    // STATE 2: Timer is Active
    if (isTimerRunning) {
      // If less than 20% time left, cat runs
      if (progress < 0.2) {
        return const CatRun();
      }
      // Otherwise, he's just chilling/working
      return const CatIdle();
    }

    // STATE 3: Default / Paused
    // Paused: Cat sits.
    return const CatSitting();
  }
}