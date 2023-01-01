import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:math' as math;

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Broomin',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<HomeController>(
          id: 'circle&b',
          builder: (_) {
            return CustomPaint(
              foregroundPainter: BPainter(progress: controller.bAnimCon.value),
              size: Size(300.0, (300.0 * 0.625).toDouble()),
              painter: CirclePainter(progress: controller.circleAnimCon.value),
              child: GetBuilder<HomeController>(
                id: 'confetti',
                builder: (_) {
                  return CustomPaint(
                    foregroundPainter: ConfettiPainter(progress: controller.confettiAnimCon.value),
                    size: const Size(300.0, (300.0 * 0.625)),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ConfettiPainter extends CustomPainter {
  final double progress;
  const ConfettiPainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..color = const Color.fromARGB(255, 84, 54, 88);
    Path path = Path();
    path.moveTo(size.width * 0.6787500, size.height * 0.1300000);
    path.lineTo(size.width * 0.6887500, size.height * 0.0740000);
    path.moveTo(size.width * 0.7050000, size.height * 0.1500000);
    path.lineTo(size.width * 0.7350000, size.height * 0.0800000);
    path.moveTo(size.width * 0.7237500, size.height * 0.1800000);
    path.lineTo(size.width * 0.7600000, size.height * 0.1400000);
    path.moveTo(size.width * 0.2937500, size.height * 0.8760000);
    path.lineTo(size.width * 0.2562500, size.height * 0.9120000);
    path.moveTo(size.width * 0.3125000, size.height * 0.9120000);
    path.lineTo(size.width * 0.2825000, size.height * 0.9760000);
    path.moveTo(size.width * 0.3400000, size.height * 0.9160000);
    path.lineTo(size.width * 0.3400000, size.height * 0.9880000);

    animatePath(canvas, path, paint, progress);
  }

  animatePath(Canvas canvas, Path path, Paint paint, double progress) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      path = pathMetric.extractPath(0.0, progress * pathMetric.length);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  final double progress;

  const CirclePainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()..color = const Color.fromARGB(255, 84, 54, 88);
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: 60.0),
        0.0,
        progress,
        false,
        paint0);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset((size.width / 2) + 10.0, (size.height / 2) - 5.0),
            radius: 60.0),
        0,
        progress,
        false,
        paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => progress >= 2 * math.pi;
}

class BPainter extends CustomPainter {
  final double progress;
  const BPainter({required this.progress});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = const Color.fromARGB(255, 33, 150, 243)
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7.0;

    Path path = Path();
    path.moveTo(size.width * 0.4812500, size.height * 0.3975200);
    path.lineTo(size.width * 0.4467500, size.height * 0.3836800);
    path.quadraticBezierTo(size.width * 0.5118375, size.height * 0.3791800,
        size.width * 0.5235125, size.height * 0.3900800);
    path.cubicTo(
        size.width * 0.5486750,
        size.height * 0.4082000,
        size.width * 0.5495750,
        size.height * 0.4352800,
        size.width * 0.5469875,
        size.height * 0.4483200);
    path.quadraticBezierTo(size.width * 0.5436750, size.height * 0.4845800,
        size.width * 0.4978625, size.height * 0.5003600);
    path.quadraticBezierTo(size.width * 0.5410125, size.height * 0.5016400,
        size.width * 0.5524875, size.height * 0.5116600);
    path.cubicTo(
        size.width * 0.5682750,
        size.height * 0.5223200,
        size.width * 0.5780125,
        size.height * 0.5518200,
        size.width * 0.5821125,
        size.height * 0.5855200);
    path.cubicTo(
        size.width * 0.5780625,
        size.height * 0.6293400,
        size.width * 0.5594125,
        size.height * 0.6550200,
        size.width * 0.5425250,
        size.height * 0.6661400);
    path.quadraticBezierTo(size.width * 0.4410125, size.height * 0.6983800,
        size.width * 0.4194375, size.height * 0.5533600);
    path.quadraticBezierTo(size.width * 0.4204500, size.height * 0.5858000,
        size.width * 0.4442000, size.height * 0.6294200);
    path.quadraticBezierTo(size.width * 0.4583875, size.height * 0.6606800,
        size.width * 0.4812500, size.height * 0.6661000);
    path.lineTo(size.width * 0.4812500, size.height * 0.3975200);
    path.close();
    animatePath(canvas, path, paint, progress);
  }

  animatePath(Canvas canvas, Path path, Paint paint, double progress) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      path = pathMetric.extractPath(0.0, progress * pathMetric.length);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return progress >= 1.0;
  }
}
