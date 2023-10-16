// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String IMAGE_PATH = 'assets/images/';
const String ICON_PATH = 'assets/icons/';
const String FONT_PATH = 'assets/fonts/';

class AssetManager {
  static String getImagePath(String imageName) {
    return IMAGE_PATH + imageName;
  }

  static String getIconPath(String iconName) {
    return ICON_PATH + iconName;
  }

  static String getFontPath(String fontName) {
    return FONT_PATH + fontName;
  }
}

class FontManager {
  static const String fontFamily = 'Poppins';

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight normal = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;

  static const double small = 12.0;
  static const double medium = 14.0;
  static const double large = 16.0;
}

class IconManager {
  // Bottom icon
  static const String bottomHomeIcon = 'bottom/ic_home.svg';
  static const String bottomHistoryIcon = 'bottom/ic_history.svg';
  static const String bottomSettingIcon = 'bottom/ic_setting.svg';

  // Common icon
  static const String notificationIcon = 'common/ic_notification.svg';
  static const String editIcon = 'common/ic_edit.svg';
  static const String unionIcon = 'common/ic_union.svg';

  static const String icBack = 'teacher/ic_back.svg';
  static const String icBell = 'teacher/ic_bell.svg';
  static const String icCamera = 'teacher/ic_camera.svg';
  static const String icEdit = 'teacher/ic_edit.svg';
  static const String icLogout = 'teacher/ic_logout.svg';
  static const String icNext = 'teacher/ic_next.svg';
  static const String icRateEmpty = 'teacher/ic_rate_empty.svg';
  static const String icRate = 'teacher/ic_rate.svg';
  static const String icUser = 'teacher/ic_user.svg';
}

class ImageManager {}
