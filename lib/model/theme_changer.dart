import 'dart:async';

import 'package:day_night_theme_flutter/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';

class DayNightThemeChanger extends ChangeNotifier {
  ThemeData _selectedTheme;

  final ThemeData lightTheme;

  final ThemeData darkTheme;

  /// Morning hour in 24 hours format
  /// default is 6 in the morning
  final int sunriseHour;

  /// Morning minutes
  /// default in 0
  final int sunriseMinutes;

  /// Evening start hour in 24 hours format
  /// default is 19
  final int sunsetHour;

  /// Evening start minutes
  /// default in 0
  final int sunsetMinutes;

  /// Timer will be required to change the theme after some time.
  Timer _timer;

  DayNightThemeChanger(
    this.lightTheme,
    this.darkTheme,
    this.sunsetHour,
    this.sunsetMinutes,
    this.sunriseHour,
    this.sunriseMinutes,
  ) {
    assert(darkTheme != null, 'darkTheme can\'t be null');
    assert(lightTheme != null, 'lightTheme can\'t be null');
    assert(sunsetHour != null, 'sunsetHour can\'t be null');
    assert(sunsetMinutes != null, 'sunsetMinutes can\'t be null');
    assert(sunriseHour != null, 'sunriseHour can\'t be null');
    assert(sunriseMinutes != null, 'sunriseMinutes can\'t be null');
    assert(
        sunriseHour < sunsetHour ||
            (sunriseHour == sunsetHour && sunriseMinutes < sunsetMinutes),
        'sunrise time must be less than sunset time');

    _init();
  }

  _init() {
    DateTime now = CustomDateTime.current;

    // Dark theme start time evening 7 pm
    DateTime sunsetTime = DateTime(
      now.year,
      now.month,
      now.day,
      this.sunsetHour,
      this.sunsetMinutes,
    );
    // Dark theme to Light switch happen at 6 am
    DateTime sunriseTime = DateTime(
      now.year,
      now.month,
      now.day,
      this.sunriseHour,
      this.sunriseMinutes,
    );

    // time left to change the theme
    int timerSeconds;

    if (now.isAfter(sunriseTime) && now.isBefore(sunsetTime)) {
      debugPrint('Changing theme to lightTheme');
      changeTheme(lightTheme);
      timerSeconds = sunsetTime.difference(now).inMilliseconds;
    } else if (now.isAfter(sunsetTime)) {
      debugPrint('Changing theme to darkTheme');
      changeTheme(darkTheme);
      DateTime nextDayMorningTime = sunriseTime.add(Duration(days: 1));
      timerSeconds = nextDayMorningTime.difference(now).inMilliseconds;
    } else {
      debugPrint('Changing theme to darkTheme');
      changeTheme(darkTheme);
      timerSeconds = sunriseTime.difference(now).inMilliseconds;
    }
    debugPrint('Time left to change the theme $timerSeconds');

    _timer?.cancel();

    _timer = Timer(
      Duration(milliseconds: timerSeconds),
      () {
        _init();
      },
    );
  }

  /// Manually chnage the theme of the app
  /// If you don't wish to change the theme at sunset / sunrise time
  /// set the ``turnOffDynamicThemeChange`` to true
  changeTheme(ThemeData newTheme, {bool turnOffDynamicThemeChange = false}) {
    _selectedTheme = newTheme;
    notifyListeners();
    if (turnOffDynamicThemeChange) {
      _timer?.cancel();
    }
  }

  /// Currently selected theme
  ThemeData get selectedTheme => _selectedTheme;

  /// returns true if current selected theme is light theme
  bool get isLightTheme => _selectedTheme == lightTheme;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
