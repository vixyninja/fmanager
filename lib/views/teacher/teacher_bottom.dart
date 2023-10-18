import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/views/widgets/widget.dart';
import 'package:fmanager/views/teacher/function.dart';

class TeacherBottomNavigation extends StatefulWidget {
  const TeacherBottomNavigation({super.key});

  @override
  State<TeacherBottomNavigation> createState() => _TeacherBottomNavigationState();
}

class _TeacherBottomNavigationState extends State<TeacherBottomNavigation> {
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
          for (final screen in teacherBottomNavigation)
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
        children: teacherBottomNavigation.map((screen) => screen['screen'] as Widget).toList(),
      ),
    );
  }
}
