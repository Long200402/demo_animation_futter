import 'package:flutter/material.dart';

class AnimationCurvedDemo extends StatefulWidget {
  const AnimationCurvedDemo({super.key});

  @override
  State<AnimationCurvedDemo> createState() => _AnimationCurvedDemoState();
}

class _AnimationCurvedDemoState extends State<AnimationCurvedDemo> with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<Color?> _animationColor;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _animationColor = ColorTween(
      begin: const Color(0xff2196f3),
      end: const Color(0xfff44336),
    ).animate(_animationController);
    _animation = Tween<double>(begin: 0, end: 300).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    )..addListener(
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
          'AnimationCurvedDemo',
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          height: 40 + _animation.value,
          width: 40 + _animation.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _animationColor.value,
          ),
        ),
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
