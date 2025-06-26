import 'package:flutter/material.dart';
import 'package:grovia/core/theme/theme.dart';
import 'package:grovia/featuers/auth/domain/entities/user.dart';
import 'package:grovia/featuers/auth/presentation/pages/home_screen.dart';
import 'package:grovia/featuers/auth/presentation/pages/login_screen.dart';
import 'package:grovia/featuers/auth/presentation/pages/register.dart';
import 'package:grovia/featuers/auth/presentation/pages/splash_screen.dart';
import 'package:grovia/featuers/auth/presentation/pages/welcome-page.dart';

final TextTheme appTextTheme = const TextTheme(
  displayLarge: TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  displayMedium: TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  displaySmall: TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  headlineMedium: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  headlineSmall: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  ),
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  ),
  bodyLarge: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  ),
  labelLarge: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
  labelMedium: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  ),
  labelSmall: TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  ),
);
final MaterialTheme appMaterialTheme = MaterialTheme(appTextTheme);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appMaterialTheme.light(),
      darkTheme: appMaterialTheme.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(body: Center(child: SplashScreen())),
      routes: {
        'splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/register': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;

          if (args is UserRole) {
            return RegisterScreen(role: args);
          }

          return const RegisterScreen(role: UserRole.customer);
        },
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
