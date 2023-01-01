import 'package:flutter/animation.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController circleAnimCon;
  late AnimationController bAnimCon;
  late AnimationController confettiAnimCon;

  @override
  void onInit() {
    circleAnimCon = AnimationController(
        vsync: this,
        upperBound: 2 * math.pi,
        duration: const Duration(seconds: 2));
    bAnimCon =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    confettiAnimCon = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 70));

    super.onInit();
  }

  @override
  void onReady() {
    circleAnimCon.forward();
    circleAnimCon.addListener(() {
      update(['circle&b']);
    });
    circleAnimCon.addStatusListener((status) {
      if (circleAnimCon.isCompleted) {
        bAnimCon.forward();
      }
    });
    bAnimCon.addListener(() {
      update(['circle&b']);
    });
    bAnimCon.addStatusListener((status) {
      if (bAnimCon.isCompleted) {
        confettiAnimCon.forward();
      }
    });
    confettiAnimCon.addListener(() {
      update(['confetti']);
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
