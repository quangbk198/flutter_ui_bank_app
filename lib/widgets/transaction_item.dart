import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionItem extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final int price;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF4F4F4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(icon, width: 20, height: 20),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1E1E2D),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Color(0xFFA2A2A7)),
                ),
              ],
            ),
          ),
        ),
        Text(
          "\$$price",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: price < 0 ? const Color(0xFF1E1E2D) : const Color(0xFF0066FF),
          ),
        ),
      ],
    );
  }
}
