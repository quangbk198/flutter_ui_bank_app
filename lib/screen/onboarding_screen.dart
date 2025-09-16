import 'package:bank_app_4/utils/app_shared_preference.dart';
import 'package:bank_app_4/utils/constant.dart';
import 'package:bank_app_4/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  final List<OnboardingData> onboardingPages = [
    OnboardingData(
      image: "assets/img_onboarding_1.svg",
      imageIndicator: "assets/onboard_indicator_1.svg",
      title: "Fastest Payment in the world",
      description:
          "Integrate multiple payment methoods to help you up the process quickly",
    ),
    OnboardingData(
      image: "assets/img_onboarding_2.svg",
      imageIndicator: "assets/onboard_indicator_2.svg",
      title: "The most Secoure Platfrom for Customer",
      description:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
    ),
    OnboardingData(
      image: "assets/img_onboarding_3.svg",
      imageIndicator: "assets/onboard_indicator_3.svg",
      title: "Paying for Everything is Easy and Convenient",
      description:
          "Built-in Fingerprint, face recognition and more, keeping you completely safe",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingPages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingPages[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: AppButton(
                onPressed: () async {
                  if (_currentIndex < onboardingPages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    await AppSharedPreferences.setBoolean(Constants.SEEN_ONBOARDING, true);
                    if (mounted) {
                      context.goNamed("login_screen");
                    }
                  }
                },
                textButton: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.data});

  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SvgPicture.asset(data.image)),
          const SizedBox(height: 40),
          SvgPicture.asset(data.imageIndicator),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E1E2D),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              data.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                height: 24 / 14,
                color: Color(0xFF7E848D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String image;
  final String imageIndicator;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.imageIndicator,
    required this.title,
    required this.description,
  });
}
