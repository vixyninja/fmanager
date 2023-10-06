import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/main/contact/contact/contact.dart';
import 'package:fmanager/views/main/history/history/history.dart';
import 'package:fmanager/views/main/home/home/home.dart';
import 'package:fmanager/views/main/setting/setting/setting.dart';

List<Map<String, dynamic>> _bottomNavigationItems = [
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHomeIcon),
    'label': 'Home',
    'screen': const HomeScreen(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHistoryIcon),
    'label': 'History',
    'screen': const HistoryScreen(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomContactIcon),
    'label': 'Contact',
    'screen': const ContactScreen(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomSettingIcon),
    'label': 'Setting',
    'screen': const SettingScreen(),
  },
];

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
          for (final screen in _bottomNavigationItems)
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
        children: _bottomNavigationItems.map((screen) => screen['screen'] as Widget).toList(),
      ),
    );
  }
}
