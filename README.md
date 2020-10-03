# day_night_theme_flutter
Use this package if you want to change the theme of your app based on the specified day and night time of the day.

## How to use?

1. Add the latest version of the package in your ```pubspec.yaml```
2. Wrap the ```MaterialApp``` with ```DayNightTheme``` widget.

```
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Light theme of your app
  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );
  // Dark theme of your app
  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return DayNightTheme(
      // specify your themes
      darkTheme: _darkTheme,
      lightTheme: _lightTheme,
      // sunrise time in 24 hours format
      sunriseHour: 6,
      sunriseMinutes: 30,
      // sunset time in 24 hours format
      sunsetHour: 19,
      sunsetMinutes: 0,
      builder: (selectedTheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          // apply the theme
          theme: selectedTheme,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
```

## Supporters
[<img src="https://flutteragency.com/wp-content/themes/flutteragency/assets/images/flutter-logo.png" width = "200"/>](https://flutteragency.com/)
