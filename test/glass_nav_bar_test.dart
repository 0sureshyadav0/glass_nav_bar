import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glass_nav_bar/glass_nav_bar.dart';
import 'package:glass_nav_bar/nav_bar_item.dart'; // Update with your actual import path

void main() {
  group('GlassNavBar', () {
    testWidgets('renders with correct items', (WidgetTester tester) async {
      // Arrange
      final items = [
        NavBarItem(icon: Icons.home, label: 'Home'),
        NavBarItem(icon: Icons.search, label: 'Search'),
        NavBarItem(icon: Icons.notifications, label: 'Alerts'),
        NavBarItem(icon: Icons.person, label: 'Profile'),
      ];
      int selectedIndex = 0;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (_) {},
              textColor: Colors.white,
              iconColor: Colors.white,
              activeIconColor: Colors.white,
              activeTextColor: Colors.white,
              items: items,
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Alerts'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('calls onItemTapped when an item is tapped',
        (WidgetTester tester) async {
      // Arrange
      final items = [
        NavBarItem(icon: Icons.home, label: 'Home'),
        NavBarItem(icon: Icons.search, label: 'Search'),
        NavBarItem(icon: Icons.notifications, label: 'Alerts'),
        NavBarItem(icon: Icons.person, label: 'Profile'),
      ];
      int tappedIndex = -1;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavBar(
              selectedIndex: 0,
              onItemTapped: (index) {
                tappedIndex = index;
              },
              textColor: Colors.white,
              iconColor: Colors.white,
              activeIconColor: Colors.white,
              activeTextColor: Colors.white,
              items: items,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Search'));
      await tester.pump();

      // Assert
      expect(tappedIndex, 1); // "Search" is at index 1
    });

    testWidgets('highlights selected item', (WidgetTester tester) async {
      // Arrange
      final items = [
        NavBarItem(icon: Icons.home, label: 'Home'),
        NavBarItem(icon: Icons.search, label: 'Search'),
        NavBarItem(icon: Icons.notifications, label: 'Alerts'),
        NavBarItem(icon: Icons.person, label: 'Profile'),
      ];
      int selectedIndex = 2; // "Alerts" is selected

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: GlassNavBar(
              selectedIndex: selectedIndex,
              onItemTapped: (_) {},
              textColor: Colors.white,
              iconColor: Colors.white,
              activeIconColor: Colors.white,
              activeTextColor: Colors.white,
              items: items,
            ),
          ),
        ),
      );

      // Assert
      final alertsIcon = tester.widget<Icon>(find.byIcon(Icons.notifications));
      expect(alertsIcon.color, Colors.white);

      final homeIcon = tester.widget<Icon>(find.byIcon(Icons.home));
      expect(homeIcon.color, Colors.white60);
    });
  });
}
