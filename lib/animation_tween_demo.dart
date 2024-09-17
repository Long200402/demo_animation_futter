import 'package:flutter/material.dart';

class AnimationTweenDemo extends StatefulWidget {
  const AnimationTweenDemo({super.key});

  @override
  State<AnimationTweenDemo> createState() => _AnimationTweenDemoState();
}

class _AnimationTweenDemoState extends State<AnimationTweenDemo> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<Color?> _animationColor;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _animationColor = ColorTween(begin: const Color(0xff2196f3), end: const Color(0xfff44336))
        .animate(_animationController);
    _animation = Tween<double>(begin: 0, end: 300).animate(_animationController)
      ..addListener(
        () {
          setState(() {});
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AnimationTweenDemo',
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 40 + _animation.value,
              width: 40 + _animation.value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _animationColor.value,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return child??const SizedBox();
            },
            child: Container(
              decoration: BoxDecoration(

              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!_animationController.isCompleted) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        },
        child: const Icon(Icons.start),
      ),
    );
  }
}
