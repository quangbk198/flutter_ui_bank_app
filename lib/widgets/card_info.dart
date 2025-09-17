import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardInfo extends StatelessWidget {
  final String cardNumber;
  final String ownerCard;
  final String expiryDate;
  final String cvv;

  const CardInfo({
    super.key,
    required this.cardNumber,
    required this.ownerCard,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF25253D),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Image.asset("assets/ic_worldmap.png"),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/ic_chip.svg"),
                const SizedBox(height: 16),
                Text(
                  cardNumber,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  ownerCard,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Expiry Date',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFFA2A2A7),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          expiryDate,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'CVV',
                          style: TextStyle(
                            fontSize: 9,
                            color: Color(0xFFA2A2A7),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          cvv,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/ic_master_card_branch.svg'),
                        const Text(
                          'Mastercard',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
