import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/views/manager/function.dart';

class ManagerBottomNavigation extends StatefulWidget {
  const ManagerBottomNavigation({super.key});

  @override
  State<ManagerBottomNavigation> createState() => _ManagerBottomNavigationState();
}

class _ManagerBottomNavigationState extends State<ManagerBottomNavigation> {
  int _currentIndex = 0;
  late PageController _pageController;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _navigateTo(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentIndex,
      keepPage: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          for (final screen in managerBottomNavigation)
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                screen['icon'] as String,
              ),
              activeIcon: SvgPicture.asset(
                screen['icon'] as String,
                color: theme.primaryColor,
              ),
              tooltip: screen['label'] as String,
              backgroundColor: theme.colorScheme.background,
              label: screen['label'] as String,
            ),
        ],
        currentIndex: _currentIndex,
        onTap: _navigateTo,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle: TextStyle(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        selectedItemColor: theme.colorScheme.primary,
        selectedFontSize: 12,
      ),
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: _pageController,
        pageSnapping: true,
        physics: const PageScrollPhysics(),
        clipBehavior: Clip.none,
        children: managerBottomNavigation.map((screen) => screen['screen'] as Widget).toList(),
      ),
    );
  }
}
