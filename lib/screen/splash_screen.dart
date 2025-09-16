import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/app_shared_preference.dart';
import '../utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _initializeData() async {
    bool seenOnboarding = await AppSharedPreferences.getBoolean(
      Constants.SEEN_ONBOARDING,
    );
    String route = seenOnboarding ? "/login" : "/onboarding";

    if (!mounted) return;
    context.go(route);
  }
}
