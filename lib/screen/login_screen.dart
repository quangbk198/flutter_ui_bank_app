import 'package:bank_app_4/widgets/app_button.dart';
import 'package:bank_app_4/widgets/app_text_field.dart';
import 'package:bank_app_4/widgets/back_icon.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                BackIcon(
                  onClick: () {
                    SystemNavigator.pop();
                  },
                ),
                const SizedBox(height: 54),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color(0xFF1E1E2D),
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 38),
                AppTextField(
                  label: "Email Address",
                  hint: "Enter email address",
                  controller: _emailController,
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
                AppButton(onPressed: () {}, textButton: "Sign In"),
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
                          text: "Sign Up",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF0066FF),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            context.pushNamed("sign_up_screen");
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
      ),
    );
  }
}
