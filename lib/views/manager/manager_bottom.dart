import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:fmanager/views/manager/function.dart';

class ManagerBottomNavigation extends StatefulWidget {
  const ManagerBottomNavigation({super.key});

  @override
  State<ManagerBottomNavigation> createState() => _ManagerBottomNavigationState();
}

class _ManagerBottomNavigationState extends State<ManagerBottomNavigation> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
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
                colorFilter: ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
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
      body: LazyIndexStack(
        index: _currentIndex,
        alignment: Alignment.bottomCenter,
        sizing: StackFit.expand,
        unloadWidget: const SizedBox.shrink(),
        textDirection: TextDirection.ltr,
        children: managerBottomNavigation.map((screen) => screen['screen'] as Widget).toList(),
      ),
    );
  }
}
