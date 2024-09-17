import 'package:flutter/material.dart';

class CtrlWithAnimationDemo extends StatefulWidget {
  const CtrlWithAnimationDemo({super.key});

  @override
  State<CtrlWithAnimationDemo> createState() => _CtrlWithAnimationDemoState();
}

class _CtrlWithAnimationDemoState extends State<CtrlWithAnimationDemo> with TickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;
  double sizeAnim = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    _animation = _animationController;
    _animation.addListener(
      () {
        setState(() {
          sizeAnim = 80 * _animationController.value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AnimationController',
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Container(
          height: 40 + sizeAnim,
          width: 40 + sizeAnim,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
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
