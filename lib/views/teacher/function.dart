import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/teacher/history/history/teacher_history_view.dart';
import 'package:fmanager/views/teacher/home/home/teacher_home_view.dart';
import 'package:fmanager/views/teacher/setting/setting/teacher_setting_view.dart';

List<Map<String, dynamic>> teacherBottomNavigation = [
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHomeIcon),
    'label': 'Home',
    'screen': TeacherHomeView(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHistoryIcon),
    'label': 'History',
    'screen': const TeacherHistoryView(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomSettingIcon),
    'label': 'Setting',
    'screen': TeacherSettingView(),
  },
];
