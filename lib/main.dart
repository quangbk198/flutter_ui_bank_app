import 'package:bank_app_4/screen/home_screen.dart';
import 'package:bank_app_4/screen/login_screen.dart';
import 'package:bank_app_4/screen/onboarding_screen.dart';
import 'package:bank_app_4/screen/sign_up_screen.dart';
import 'package:bank_app_4/screen/splash_screen.dart';
import 'package:bank_app_4/utils/app_shared_preference.dart';
import 'package:bank_app_4/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0066FF),
          primary: const Color(0xFF0066FF),
        ),
        fontFamily: "Poppins",
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      name: "onboarding_screen",
      path: "/onboarding",
      builder: (context, state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      name: "login_screen",
      path: "/login",
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: "sign_up_screen",
      path: "/sign_up",
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: "/home",
      name: "home_screen",
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
