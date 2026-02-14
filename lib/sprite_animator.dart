import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpriteAnimator(
          // 1. Ensure this path matches your pubspec.yaml exactly
          imagePath: 'assets/images/IdleCatb.png', 
          frameCount: 8, // 2. Change this to the number of cats in your strip
          frameWidth: 100,
          frameHeight: 100,
          duration: Duration(milliseconds: 800),
        ),
      ),
    ),
  ));
}

class SpriteAnimator extends StatefulWidget {
  final String imagePath;
  final int frameCount;
  final double frameWidth;
  final double frameHeight;
  final Duration duration;

  const SpriteAnimator({
    super.key,
    required this.imagePath,
    required this.frameCount,
    this.frameWidth = 100,
    this.frameHeight = 100,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<SpriteAnimator> createState() => _SpriteAnimatorState();
}

class _SpriteAnimatorState extends State<SpriteAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Calculate the current frame index (e.g., 0, 1, 2...)
        int frameIndex = (_controller.value * widget.frameCount).floor();

        // Calculate the X alignment to slide the strip
        // -1.0 is the far left frame, 1.0 is the far right frame
        double xAlignment = widget.frameCount > 1 
            ? -1.0 + (frameIndex * (2.0 / (widget.frameCount - 1))) 
            : -1.0;

        return SizedBox(
          width: widget.frameWidth,
          height: widget.frameHeight,
          child: ClipRect( // Acts like 'overflow: hidden'
            child: OverflowBox(
              // Allow the child image to be much wider than this SizedBox
              maxWidth: widget.frameWidth * widget.frameCount,
              alignment: Alignment(xAlignment, 0.0),
              child: Image.asset(
                widget.imagePath,
                width: widget.frameWidth * widget.frameCount,
                height: widget.frameHeight,
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
