import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship_final_recipes/translations/locale_keys.g.dart';


class AnimatedInfo extends StatefulWidget {
  final Stream<bool> animationLauncher;

  const AnimatedInfo({Key? key, required this.animationLauncher})
      : super(key: key);

  @override
  State<AnimatedInfo> createState() => _AnimatedInfoState();
}

class _AnimatedInfoState extends State<AnimatedInfo>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late StreamSubscription<bool> _eventController;

  @override
  void initState() {
    super.initState();

    _eventController = widget.animationLauncher.listen((event) {
      _startAnimation();
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 7),
      vsync: this,
    );

    _animation = TweenSequence<Offset>([
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.0, 5.0),
            end: const Offset(0.0, 2.0),
          ),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.0, 2.0),
            end: const Offset(0.0, 2.0),
          ),
          weight: 5),
      TweenSequenceItem(
          tween: Tween(
            begin: const Offset(0.0, 2.0),
            end: const Offset(0.0, -2.0),
          ),
          weight: 1),
    ]).animate(_controller);

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _eventController.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      transformHitTests: true,
      child: Container(
        height: 160.0,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(LocaleKeys.menuAbout.tr()),
            FutureBuilder<String>(
              future: _getVersion(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else {
                  return const Placeholder();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> _getVersion() async {
    try {
      const chanel = MethodChannel("todos.flutter.dev/versionInfo");
      final String version = await chanel.invokeMethod('getVersion');
      return '''Info:
        $version''';
    } catch (e) {
      return '''Exception occurred 
      $e''';
    }
  }

  void _startAnimation() {
    _controller.forward();
  }
}
