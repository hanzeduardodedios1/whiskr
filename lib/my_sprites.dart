// Purpose: Uses 'flame' engine in order to view our sprite sheet to create a moving image.
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame {

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
    // 1. Load the image (Flame looks in assets/images/ by default)
    // Ensure 'BlackCat/IdleCatb.png' is in your pubspec.yaml
    final spriteSheetImage = await images.load('BlackCat/IdleCatb.png');

    // 2. Define the layout
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: spriteSheetImage,
      columns: 7, // Change this to the ACTUAL number of cats in the strip
      rows: 1,
    );

    // 3. Create and add the component
    final animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
    );


    // ENSURES that our image will be centered
    add(
      SpriteAnimationComponent(
        animation: animation,
        size: Vector2(100, 100), // How big the cat looks on screen
        position: size / 2,
        anchor: Anchor.center,
      ),
    );
  }
}

