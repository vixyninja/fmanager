import 'package:fmanager/utils/asset_manager.dart';
import 'package:fmanager/views/manager/history/history/manager_history_view.dart';
import 'package:fmanager/views/manager/home/home/manager_home_view.dart';
import 'package:fmanager/views/manager/setting/setting/manager_setting_view.dart';

List<Map<String, dynamic>> managerBottomNavigation = [
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHomeIcon),
    'label': 'Trang chủ',
    'screen': ManagerHomeView(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomHistoryIcon),
    'label': 'Lịch sử',
    'screen': const ManagerHistoryView(),
  },
  {
    'icon': AssetManager.getIconPath(IconManager.bottomSettingIcon),
    'label': 'Cài đặt',
    'screen': ManagerSettingView(),
  },
];
