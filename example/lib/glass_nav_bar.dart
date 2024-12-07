library glass_nav_bar;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_nav_bar/nav_bar_item.dart';

class GlassNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final List<NavBarItem> items;
  final Color textColor;
  final Color iconColor;
  final Color activeTextColor;
  final Color activeIconColor;
  const GlassNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.textColor,
    required this.activeTextColor,
    required this.iconColor,
    required this.activeIconColor,
    required this.items,
  });

  @override
  GlassNavBarState createState() => GlassNavBarState();
}

class GlassNavBarState extends State<GlassNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey
                    .withAlpha((0.3 * 255).toInt()), // Frosted glass effect
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.white.withAlpha((0.3 * 255).toInt()),
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.items
                    .asMap()
                    .entries
                    .map((entry) => _buildNavBarItems(entry.key, entry.value))
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItems(int index, NavBarItem item) {
    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            color: widget.selectedIndex == index
                ? widget.activeIconColor
                : widget.iconColor,
          ),
          Text(
            item.label,
            style: TextStyle(
              color: widget.selectedIndex == index
                  ? widget.activeTextColor
                  : widget.textColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
