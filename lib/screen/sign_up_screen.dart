import 'package:bank_app_4/utils/app_shared_preference.dart';
import 'package:bank_app_4/utils/constant.dart';
import 'package:bank_app_4/utils/snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/user.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/back_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 46),
              BackIcon(
                onClick: () {
                  context.pop();
                },
              ),
              const SizedBox(height: 54),
              const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0xFF1E1E2D),
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 38),
              AppTextField(
                label: "Full Name",
                hint: "Enter full name",
                controller: _fullNameController,
                textInputAction: TextInputAction.next,
                iconLeft: "assets/ic_email.svg",
              ),
              const SizedBox(height: 21),
              AppTextField(
                label: "Phone Number",
                hint: "Enter phone number",
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                iconLeft: "assets/ic_phone.svg",
              ),
              const SizedBox(height: 21),
              AppTextField(
                label: "Email Address",
                hint: "Enter email address",
                controller: _emailAddressController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                iconLeft: "assets/ic_email.svg",
              ),
              const SizedBox(height: 21),
              AppTextField(
                label: "Password",
                hint: "Enter password",
                controller: _passwordController,
                textInputAction: TextInputAction.done,
                isPassword: true,
                iconLeft: "assets/ic_password.svg",
              ),
              const SizedBox(height: 40),
              AppButton(onPressed: () async {
                final String errorMessage = _validateInfo();

                if (errorMessage.isNotEmpty) {
                  AppSnackBar.show(context: context, message: errorMessage, onPressed: () {});
                } else {
                  final String fullName = _fullNameController.text;
                  final String phoneNumber = _phoneNumberController.text;
                  final String email = _emailAddressController.text;
                  final String password = _passwordController.text;

                  await AppSharedPreferences.setString(Constants.KEY_FULL_NAME, fullName);
                  await AppSharedPreferences.setString(Constants.KEY_PHONE_NUMBER, phoneNumber);
                  await AppSharedPreferences.setString(Constants.KEY_EMAIL, email);
                  await AppSharedPreferences.setString(Constants.KEY_PASSWORD, password);

                  final User user = User(
                    email: _emailAddressController.text,
                    password: _passwordController.text,
                  );
                  if (mounted) {
                    context.pop(user);
                  }
                }
              }, textButton: "Sign Up"),
              const SizedBox(height: 29),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "I'm a new user. ",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFA2A2A7),
                        fontFamily: "Poppins",
                      ),
                      children: [
                        TextSpan(
                            text: "Sign In",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0066FF),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              context.pop();
                            }
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validateInfo() {
    String fullName = _fullNameController.text;
    String phoneNumber = _phoneNumberController.text;
    String email = _emailAddressController.text;
    String password = _passwordController.text;

    if (fullName.isEmpty) {
      return "Full name is not empty!";
    }

    if (phoneNumber.isEmpty) {
      return "Phone number is not empty!";
    }

    if (email.isEmpty) {
      return "Email is not empty!";
    }

    if (password.isEmpty) {
      return "Password is not empty!";
    }

    return "";
  }
}
