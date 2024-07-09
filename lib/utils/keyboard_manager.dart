import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class KeyBoardManager {
  const KeyBoardManager();

  static void hideKeyboard(BuildContext context) {
    try {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      final FocusScopeNode currentFocus = FocusScope.of(context);
      if (currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
