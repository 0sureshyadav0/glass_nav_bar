library custom_nav_bar;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_nav_bar/nav_bar_item.dart';

class GlassNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  final List<NavBarItem> items;
  const GlassNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.items,
  });

  @override
  _GlassNavBarState createState() => _GlassNavBarState();
}

class _GlassNavBarState extends State<GlassNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3), // Frosted glass effect
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
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
            color:
                widget.selectedIndex == index ? Colors.white : Colors.white60,
          ),
          Text(
            item.label,
            style: TextStyle(
              color:
                  widget.selectedIndex == index ? Colors.white : Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
