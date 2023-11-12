// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String IMAGE_PATH = 'assets/images/';
const String ICON_PATH = 'assets/icons/';
const String FONT_PATH = 'assets/fonts/';
const String ANIM_PATH = 'assets/anim/';

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

  static String getAnimPath(String animName) {
    return ANIM_PATH + animName;
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

  static const String icBack = 'common/ic_back.svg';
  static const String icBell = 'common/ic_bell.svg';
  static const String icCamera = 'common/ic_camera.svg';
  static const String icEdit = 'common/ic_edit.svg';
  static const String icLogout = 'common/ic_logout.svg';
  static const String icNext = 'common/ic_next.svg';
  static const String icRateEmpty = 'common/ic_rate_empty.svg';
  static const String icRate = 'common/ic_rate.svg';
  static const String icUser = 'common/ic_user.svg';
  static const String icEarth = 'common/ic_earth.svg';
  static const String icFeed = 'common/ic_feed.svg';
  static const String icNotification = 'common/ic_notification.svg';
  static const String icCheck = 'common/ic_check.svg';
  static const String icReset = 'common/ic_reset.svg';
  static const String icImage = 'common/ic_image.svg';
  static const String icUnion = 'common/ic_union.svg';
  static const String icManager = 'common/ic_manager.svg';
  static const String icTeacher = 'common/ic_teacher.svg';
}

class ImageManager {
  static const String imgLogo = 'img_logo.png';
  static const String imgGoogle = 'img_google.png';
}

class AnimManager {
  static const String animLoadingLego = 'anim_loading_lego.json';
  static const String animDashboard = 'anim_dashboard.json';
}
