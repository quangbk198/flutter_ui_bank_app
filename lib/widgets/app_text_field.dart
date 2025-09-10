import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? iconLeft;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const AppTextField({
    super.key,
    required this.label,
    this.iconLeft,
    this.isPassword = false,
    this.hint,
    required this.controller, this.keyboardType, this.textInputAction,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isObscure = false;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: _focusNode.hasFocus
                  ? const Color(0xFF0066FF)
                  : const Color(0xFFA2A2A7),
            ),
          ),
        ],

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.iconLeft != null && widget.iconLeft!.isNotEmpty) ...[
              SvgPicture.asset(widget.iconLeft!),
            ],

            Expanded(
              child: TextField(
                controller: widget.controller,
                obscureText: _isObscure,
                focusNode: _focusNode,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                style: const TextStyle(
                  color: Color(0xFF1E1E2D),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  hintText: (widget.hint != null && widget.hint!.isNotEmpty)
                      ? widget.hint
                      : widget.label,
                  hintStyle: const TextStyle(
                    color: Color(0xFFA2A2A7),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left:
                    (widget.iconLeft != null && widget.iconLeft!.isNotEmpty)
                        ? 12
                        : 0,
                    right: widget.isPassword ? 12 : 0,
                    top: 16,
                    bottom: 16,
                  ),
                ),
              ),
            ),

            if (widget.isPassword) ...[
              IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFFA2A2A7),
                ),
              ),
            ],
          ],
        ),
        Divider(
          height: 0,
          thickness: 1.5,
          color: _focusNode.hasFocus
              ? const Color(0xFF0066FF)
              : const Color(0xFFF4F4F4),
        ),
      ],
    );
  }
}
