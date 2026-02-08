import 'package:flutter/material.dart';
import 'package:flame/widgets.dart';
import 'package:flame/extensions.dart';
import 'package:whiskr/cat_state_manager.dart';

class BlackCatIdle extends StatelessWidget {
  const BlackCatIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: SpriteAnimationWidget.asset(
        path: 'BlackCat/IdleCatb.png',
        data: SpriteAnimationData.sequenced(
          amount: 7,
          stepTime: 0.1,
          // TO FIX TO SINGLE FRAME MOVEMENT:
          // USE 32, 32 for vector
          textureSize: Vector2(32, 32), 
        ),
      ),
    );
  }
}

class CatIdle extends CatSpriteBase {
  const CatIdle({super.key}) : super(
    assetPath: 'BlackCat/IdleCatb.png', 
    frames: 7,
    frameWidth: 32.0, 
    frameHeight: 32.0,
  );
}

class CatRun extends CatSpriteBase {
  const CatRun({super.key}) : super(
    assetPath: 'BlackCat/RunCatb.png', 
    frames: 7,
    frameWidth: 32.0, 
    frameHeight: 32.0,
    speed: 0.1,
  );
}

class CatJump extends CatSpriteBase {
  const CatJump({super.key}) : super(
    assetPath: 'BlackCat/JumpCabt.png', 
    frames: 13,
    frameWidth: 32.0, 
    frameHeight: 32.0,
  );
}

class CatSitting extends CatSpriteBase {
  const CatSitting({super.key}) : super(
    assetPath: 'BlackCat/Sittingb.png', 
    frames: 3,
    frameWidth: 32.0, 
    frameHeight: 32.0,
    speed: 0.7,
  );
}