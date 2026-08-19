import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookingConformTablet extends StatelessWidget {
  const BookingConformTablet({super.key});

  static const Color primaryColor = Color(0xFF087DA5);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              children: [
                const Spacer(flex: 8),

                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutBack,
                  builder: (context, value, child) {
                    return Transform.scale(scale: value, child: child);
                  },
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 650),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return CustomPaint(
                            size: const Size(80, 80),
                            painter: _CheckPainter(value),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 58),

                const Text(
                  'Booking Confirmed',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 28),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    'Confirmation Email and SMS has been\n'
                    'send on your registered details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                  ),
                ),

                const Spacer(flex: 11),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckPainter extends CustomPainter {
  final double progress;

  _CheckPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF087DA5)
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    path.moveTo(size.width * 0.18, size.height * 0.50);

    path.lineTo(size.width * 0.39, size.height * 0.70);

    path.lineTo(size.width * 0.78, size.height * 0.28);

    final metrics = path.computeMetrics().first;

    final animatedPath = metrics.extractPath(0, metrics.length * progress);

    canvas.drawPath(animatedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _CheckPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
