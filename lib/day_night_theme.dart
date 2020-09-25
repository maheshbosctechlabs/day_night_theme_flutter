import 'package:day_night_theme_flutter/model/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayNightTheme extends StatelessWidget {
  final Widget Function(ThemeData currentTheme) builder;

  final ThemeData lightTheme;

  final ThemeData darkTheme;

  /// Sunrise hour in 24 hours format
  /// default is 6 in the morning
  final int sunriseHour;

  /// Sunrise minutes
  /// default is 0
  final int sunriseMinutes;

  /// Sunset hour in 24 hours format
  /// default is 19
  final int sunsetHour;

  /// Sunset minutes
  /// default is 0
  final int sunsetMinutes;

  final DayNightThemeChanger _themeChanger;

  DayNightTheme({
    @required this.builder,
    @required this.darkTheme,
    @required this.lightTheme,
    this.sunriseHour = 6,
    this.sunriseMinutes = 0,
    this.sunsetMinutes = 0,
    this.sunsetHour = 19,
  })  : assert(builder != null, 'builder can\'t be null'),
        assert(darkTheme != null, 'darkTheme can\'t be null'),
        assert(lightTheme != null, 'lightTheme can\'t be null'),
        assert(sunsetHour != null, 'sunsetHour can\'t be null'),
        assert(sunsetMinutes != null,
            'sunsetMinutes can\'t be null'),
        assert(sunriseHour != null, 'sunriseHour can\'t be null'),
        assert(
            sunriseMinutes != null, 'sunriseMinutes can\'t be null'),
        _themeChanger = DayNightThemeChanger(
          lightTheme,
          darkTheme,
          sunsetHour,
          sunsetMinutes,
          sunriseHour,
          sunriseMinutes,
        );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DayNightThemeChanger>.value(
      value: _themeChanger,
      builder: (context, child){
        final themeChanger = Provider.of<DayNightThemeChanger>(context);

        return builder(themeChanger.selectedTheme);
      },
    );
  }
}
