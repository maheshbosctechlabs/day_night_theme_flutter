import 'package:day_night_theme_flutter/extensions/date_time_extension.dart';
import 'package:day_night_theme_flutter/model/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );
  test("isLightTheme false before sunrise", () {
    DateTime now = DateTime.now();
    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 11, 55);

    DayNightThemeChanger themeChanger =
        DayNightThemeChanger(_lightTheme, _darkTheme, 2, 13, 2, 12);

    expect(themeChanger.isLightTheme, false);
  });

  test("isLightTheme true during the day", () {
    DateTime now = DateTime.now();
    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 12, 30);

    DayNightThemeChanger themeChanger =
        DayNightThemeChanger(_lightTheme, _darkTheme, 2, 13, 2, 12);

    expect(themeChanger.isLightTheme, true);
  });

  test("isLightTheme false after sunset", () {
    DateTime now = DateTime.now();
    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 14, 30);

    DayNightThemeChanger themeChanger =
        DayNightThemeChanger(_lightTheme, _darkTheme, 2, 13, 2, 12);

    expect(themeChanger.isLightTheme, false);
  });

  test("theme changes from dark to light", () async {
    DateTime now = DateTime.now();
    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 11, 55);

    DayNightThemeChanger themeChanger =
        DayNightThemeChanger(_lightTheme, _darkTheme, 2, 13, 2, 12);

    expect(themeChanger.isLightTheme, false);

    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 12, 30);

    await Future.delayed(Duration(seconds: 10));

    expect(themeChanger.isLightTheme, true);
  });

  test("theme changes from light to dark", () async {
    DateTime now = DateTime.now();

    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 12, 55);

    DayNightThemeChanger themeChanger =
        DayNightThemeChanger(_lightTheme, _darkTheme, 2, 13, 2, 12);

    expect(themeChanger.isLightTheme, true);

    CustomDateTime.customTime =
        DateTime(now.year, now.month, now.day, 2, 13, 30);

    await Future.delayed(Duration(seconds: 10));

    expect(themeChanger.isLightTheme, false);
  });
}
