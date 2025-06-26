// في ملف: lib/features/splash/presentation/pages/splash_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grovia/featuers/auth/presentation/cubit/authentication_cubit.dart';
import 'dart:math'
    as math; // استيراد مكتبة الرياضيات لاستخدامها في حسابات الدوران

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // للـ Fade Animation الخاصة بالشعار الرئيسي (والتي ستتحكم أيضاً في ظهور الجملة)
  late AnimationController _mainAnimationController;
  late Animation<double> _logoFadeAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<double>
  _taglineFadeAnimation; // انيميشن تلاشي للجملة التحت الشعار

  // للـ Animation الخاصة بالخطوط المتحركة في الخلفية
  late AnimationController _lineAnimationController;
  late Animation<double> _lineMovementAnimation;

  @override
  void initState() {
    super.initState();

    // 1. تهيئة الـ AnimationController الرئيسي (لشعار التطبيق والجملة)
    _mainAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // مدة ظهور الانيميشن الأساسية
    );

    // انيميشن تلاشي الشعار (يظهر في النصف الأول من مدة الانيميشن الرئيسية)
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ), // يتلاشى في أول 50% من الوقت
      ),
    );

    // انيميشن حركة الشعار من الأعلى (يتحرك في النصف الأول أيضاً)
    _logoSlideAnimation =
        Tween<Offset>(
          begin: const Offset(
            0,
            -0.5,
          ), // يبدأ من منتصف الشاشة لأعلى (0.5 من ارتفاع الشاشة)
          end: Offset.zero, // ينتهي في مكانه الأصلي (بدون offset)
        ).animate(
          CurvedAnimation(
            parent: _mainAnimationController,
            curve: const Interval(
              0.0,
              0.7,
              curve: Curves.elasticOut,
            ), // تأثير نطتين (bounce)
          ),
        );

    // انيميشن تلاشي الجملة التحت الشعار (تبدأ متأخرة بعد حركة الشعار)
    _taglineFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(
          0.6,
          1.0,
          curve: Curves.easeIn,
        ), // تبدأ من 60% وتتلاشى حتى النهاية
      ),
    );

    // Listener للـ AnimationController الرئيسي: عندما تنتهي، نتحقق من حالة المصادقة وننتقل
    _mainAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _navigateToNextScreen();
      }
    });

    _mainAnimationController.forward(); // بدء انيميشن الشعار والجملة

    // 2. تهيئة الـ AnimationController للخطوط المتحركة في الخلفية
    _lineAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // مدة حركة الخطوط (4 ثواني)
    );

    // انيميشن لحركة الخطوط من 0.0 إلى 1.0 (تمثل نسبة حركة من اليمين لليسار)
    _lineMovementAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _lineAnimationController,
        curve: Curves.linear, // حركة خطية ثابتة للخطوط
      ),
    );

    _lineAnimationController.forward(); // جعل انيميشن الخطوط تتكرر باستمرار
  }

  // دالة للانتقال للشاشة التالية بناءً على حالة المصادقة
  void _navigateToNextScreen() {
    final authState = context.read<AuthenticationCubit>().state;
    if (authState is AuthenticationAuthenticated) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(
        context,
        '/welcome',
      ); // '/' هو الـ route بتاع WelcomePage
    }
  }

  @override
  void dispose() {
    _mainAnimationController.dispose();
    _lineAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor:
          theme.colorScheme.surfaceContainerHighest, // خلفية أغمق قليلاً
      body: Stack(
        // استخدام Stack لوضع العناصر فوق بعضها
        children: [
          // 1. الخلفية المتحركة (CustomPaint ملفوفة في AnimatedBuilder و Transform.rotate)
          AnimatedBuilder(
            animation: _lineMovementAnimation,
            builder: (context, child) {
              // تحديد زاوية الدوران للخطوط (دوران كامل 360 درجة مع تقدم الانيميشن)
              // يتم تطبيق الدوران على "مجموعة" الخطوط ككل حول مركز الشاشة
              final double rotationAngle =
                  _lineMovementAnimation.value * (2 * math.pi); // 0 to 2*pi

              return Transform.rotate(
                // <--- تطبيق الدوران على الـ CustomPaint بالكامل
                angle: rotationAngle,
                // يتم الدوران حول مركز الشاشة (الـ Origin الافتراضي لـ Transform.rotate هو المنتصف)
                child: CustomPaint(
                  painter: LinePainter(
                    animationValue: _lineMovementAnimation.value,
                    primaryColor: theme
                        .colorScheme
                        .primary, // تمرير الـ primaryColor من الثيم
                    width: MediaQuery.of(context).size.width, // عرض الشاشة
                    height: MediaQuery.of(context).size.height, // ارتفاع الشاشة
                  ),
                  child: Container(), // CustomPaint لازم يكون ليه child
                ),
              );
            },
          ),
          // 2. الشعار والنص (FadeTransition + SlideTransition)
          Center(
            child: FadeTransition(
              // تأثير التلاشي الرئيسي لكل الكتلة (الشعار والجملة)
              opacity:
                  _logoFadeAnimation, // نستخدم هنا الـ logo fade animation كـ opacity للكتلة
              child: SlideTransition(
                // تأثير الانزلاق من الأعلى
                position: _logoSlideAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'G',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: theme
                                .colorScheme
                                .primary, // كل الشعار بنفس الـ primaryColor
                          ),
                        ),
                        Text(
                          'rovia',
                          style: theme.textTheme.headlineLarge?.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: theme
                                .colorScheme
                                .primary, // كل الشعار بنفس الـ primaryColor
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // الجملة الآن لها FadeTransition خاصة بها لتأخير ظهورها
                    FadeTransition(
                      opacity: _taglineFadeAnimation,
                      child: Text(
                        'Smart, easy to Grow your Startup',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// <--- الكلاس الجديد لـ CustomPainter --->
class LinePainter extends CustomPainter {
  final double animationValue; // قيمة الانيميشن للتحكم في حركة الخطوط
  final Color primaryColor; // اللون الأساسي للخطوط
  final double width; // عرض الشاشة
  final double height; // ارتفاع الشاشة

  LinePainter({
    required this.animationValue,
    required this.primaryColor,
    required this.width,
    required this.height,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle
          .stroke // لرسم خطوط فقط
      ..strokeWidth = 5.0; // سمك الخط أعرض (5.0)

    // عدد الخطوط اللي هنعرضها
    const int numberOfLines = 6;
    // المسافة الرأسية بين كل خط والتاني
    final double verticalSpacing = size.height / (numberOfLines + 1);

    // طول الخط
    const double lineLength = 100.0;
    // المسافة الإضافية اللي الخط هيتحركها عشان يختفي تماماً
    final double totalTravelRange = size.width + lineLength * 2;

    for (int i = 0; i < numberOfLines; i++) {
      // تحديد اللون والشفافية لكل خط
      paint.color = primaryColor.withOpacity(
        0.2 + (i * 0.05),
      ); // شفافية مختلفة لكل خط

      final double y = verticalSpacing * (i + 1);

      double currentX;
      // offset مختلف لكل خط عشان متجيش كلها في نفس الوقت
      final double lineStartOffset = i * 40.0;

      // النصف العلوي من الشاشة (خطوط من اليمين للشمال)
      if (y < size.height / 2) {
        currentX =
            size.width + lineStartOffset - (animationValue * totalTravelRange);
      }
      // النصف السفلي من الشاشة (خطوط من الشمال لليمين)
      else {
        currentX = -lineStartOffset + (animationValue * totalTravelRange);
      }

      canvas.drawLine(
        Offset(currentX, y),
        Offset(currentX + lineLength, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    // إعادة الرسم فقط لو قيمة الانيميشن اتغيرت
    return oldDelegate.animationValue != animationValue;
  }
}
