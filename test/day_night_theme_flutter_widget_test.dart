import 'package:day_night_theme_flutter/day_night_theme_flutter.dart';
import 'package:day_night_theme_flutter/extensions/date_time_extension.dart';
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

  final scaffoldKey = ValueKey('Scaffold');

  testWidgets(
    "Theme is dark before sunrise",
    (WidgetTester tester) async {
      DateTime now = DateTime.now();
      CustomDateTime.customTime = DateTime(now.year, now.month, now.day, 2, 11);
      Widget testingWidget = DayNightTheme(
        builder: (selectedTheme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: selectedTheme,
            home: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text('Widget Testing'),
              ),
            ),
          );
        },
        darkTheme: _darkTheme,
        lightTheme: _lightTheme,
        sunriseHour: 2,
        sunriseMinutes: 12,
        sunsetHour: 2,
        sunsetMinutes: 13,
      );
      await tester.pumpWidget(testingWidget);
      expect(Theme.of(tester.element(find.byKey(scaffoldKey))).brightness,
          _darkTheme.brightness);
    },
  );

  testWidgets(
    "Theme is light during the day",
    (WidgetTester tester) async {
      DateTime now = DateTime.now();
      CustomDateTime.customTime =
          DateTime(now.year, now.month, now.day, 2, 12, 30);
      Widget testingWidget = DayNightTheme(
        builder: (selectedTheme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: selectedTheme,
            home: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text('Widget Testing'),
              ),
            ),
          );
        },
        darkTheme: _darkTheme,
        lightTheme: _lightTheme,
        sunriseHour: 2,
        sunriseMinutes: 12,
        sunsetHour: 2,
        sunsetMinutes: 13,
      );
      await tester.pumpWidget(testingWidget);

      expect(Theme.of(tester.element(find.byKey(scaffoldKey))).brightness,
          _lightTheme.brightness);
    },
  );

  testWidgets(
    "Theme is dark after sunset",
    (WidgetTester tester) async {
      DateTime now = DateTime.now();
      CustomDateTime.customTime = DateTime(now.year, now.month, now.day, 2, 14);
      Widget testingWidget = DayNightTheme(
        builder: (selectedTheme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: selectedTheme,
            home: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text('Widget Testing'),
              ),
            ),
          );
        },
        darkTheme: _darkTheme,
        lightTheme: _lightTheme,
        sunriseHour: 2,
        sunriseMinutes: 12,
        sunsetHour: 2,
        sunsetMinutes: 13,
      );
      await tester.pumpWidget(testingWidget);

      expect(Theme.of(tester.element(find.byKey(scaffoldKey))).brightness,
          _darkTheme.brightness);
    },
  );
}
