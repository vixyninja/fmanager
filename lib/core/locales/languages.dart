import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fmanager/core/locales/en.dart';
import 'package:fmanager/core/locales/vi.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static final locale = _getLocaleFromLanguage();

  static const fallbackLocale = Locale('en', 'US');

  static final langCodes = ['en', 'vi'];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('vi', 'VN'),
  ];

  static final langs = LinkedHashMap.from({
    'en': 'English',
    'vi': 'Tiếng Việt',
  });

  static void changeLocale(String langCode) {
    final locale = _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {'en_US': en, 'vi_VN': vi};

  static Locale _getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale!.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
    }
    return Get.locale!;
  }
}
