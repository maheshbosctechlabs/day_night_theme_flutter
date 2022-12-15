// This extension was created for tests only

extension CustomDateTime on DateTime {
  static DateTime? customTime;
  static DateTime get current => customTime ?? DateTime.now();
}
