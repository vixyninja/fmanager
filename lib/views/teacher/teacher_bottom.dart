import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fmanager/core/widgets/widget.dart';
import 'package:fmanager/views/teacher/function.dart';
import 'package:fmanager/views/teacher/teacher_binding.dart';

class TeacherBottomNavigation extends StatefulWidget {
  const TeacherBottomNavigation({super.key});

  @override
  State<TeacherBottomNavigation> createState() => _TeacherBottomNavigationState();
}

class _TeacherBottomNavigationState extends State<TeacherBottomNavigation> {
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
    TeacherBinding().dependencies();
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
          for (final screen in teacherBottomNavigation)
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
