import 'package:bank_app_4/widgets/horizontal_item.dart';
import 'package:flutter/material.dart';

import '../widgets/back_icon.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _biometricValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackIcon(onClick: () {}),
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1E2D),
                  ),
                ),
                BackIcon(onClick: () {}, icon: Icons.logout),
              ],
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'General',
                    style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  HorizontalItem(
                    title: 'Language',
                    onClick: () {},
                    showDivider: true,
                  ),
                  HorizontalItem(
                    title: 'My Profile',
                    onClick: () {},
                    showDivider: true,
                  ),
                  HorizontalItem(
                    title: 'Contact Us',
                    onClick: () {},
                    showDivider: true,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Security',
                    style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  HorizontalItem(
                    title: 'Change Password',
                    onClick: () {},
                    showDivider: true,
                  ),
                  HorizontalItem(
                    title: 'Privacy Policy',
                    onClick: () {},
                    showDivider: true,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Choose what data you share with us',
                    style: TextStyle(color: Color(0xFFA2A2A7), fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  HorizontalItem(
                    title: 'Biometric',
                    rightItem: Switch(
                      value: _biometricValue,
                      onChanged: (value) => setState(() {
                        _biometricValue = value;
                      }),
                    ),
                    onClick: () {
                      setState(() {
                        _biometricValue = !_biometricValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
