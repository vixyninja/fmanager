abstract class RegExpConstants {
  static const String linkSuffix = r'(\)|]|,|\*)(.)*$';
  static const String number = '[0-9]+';
  static const String email = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$';
}
