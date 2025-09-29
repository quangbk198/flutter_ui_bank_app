import 'package:flutter/material.dart';

class AmountLimitItem extends StatefulWidget {
  const AmountLimitItem({super.key});

  @override
  State<AmountLimitItem> createState() => _AmountLimitItemState();
}

class _AmountLimitItemState extends State<AmountLimitItem> {
  double _amount = 0;
  final double _min = 0;
  final double _max = 10000;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Amount: \$8,822.00',
              style: TextStyle(color: Color(0xFF1E1E2D), fontSize: 13),
            ),
            const SizedBox(height: 16),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF0066FF),
                inactiveTrackColor: Colors.white,
                trackHeight: 7,
                thumbColor: Colors.white,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                overlayShape: SliderComponentShape.noThumb,
                padding: EdgeInsets.zero,
              ),
              child: Slider(
                value: _amount,
                onChanged: (value) {
                  setState(() {
                    _amount = value;
                  });
                },
                min: _min,
                max: _max,
              ),
            ),
            const SizedBox(height: 12),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${_min.toStringAsFixed(0)}",
                      style: const TextStyle(color: Color(0xFFA2A2A7), fontSize: 12),
                    ),
                    Text(
                      "\$${_max.toStringAsFixed(0)}",
                      style: const TextStyle(color: Color(0xFFA2A2A7), fontSize: 12),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(
                    ((_amount - _min) / (_max - _min)) * 2 - 1,
                    0,
                  ),
                  child: Text(
                    "\$${_amount.toStringAsFixed(0)}",
                    style: const TextStyle(color: Color(0xFF1E1E2D), fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
