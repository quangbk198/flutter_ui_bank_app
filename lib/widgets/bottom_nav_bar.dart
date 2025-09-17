import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  final int indexSelected;
  final ValueChanged<int> onChangeTab;

  const BottomNavBar({
    super.key,
    required this.indexSelected,
    required this.onChangeTab,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFF4F4F4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tabItem(index: 0, icon: 'assets/ic_tab_home.svg', label: 'Home'),
          _tabItem(index: 1, icon: 'assets/ic_tab_card.svg', label: 'My Cards'),
          _tabItem(index: 2, icon: 'assets/ic_tab_statistics.svg', label: 'Statistics'),
          _tabItem(index: 3, icon: 'assets/ic_tab_settings.svg', label: 'Settings'),
        ],
      ),
    );
  }

  Widget _tabItem({
    required int index,
    required String icon,
    required String label,
  }) {
    return IconButton(
      onPressed: () {
        if (widget.indexSelected != index) {
          widget.onChangeTab(index);
        }
      },
      icon: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              widget.indexSelected == index
                  ? const Color(0xFF0066FF)
                  : const Color(0xFF8B8B94),
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: widget.indexSelected == index
                  ? const Color(0xFF0066FF)
                  : const Color(0xFF8B8B94),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
