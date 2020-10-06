# day_night_theme_flutter
A Flutter plugin that helps you to automatically change the theme of the app with sunrise and sunset. Just specify the light and dark theme to use, and you are all set. You can use your custom sunrise and sunset time too.

<img src = "https://github.com/maheshbosctechlabs/day_night_theme_flutter/blob/main/plugin_preview.png" height= "700"/>

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
[<img src="https://bosctechlabs.com/wp-content/themes/bosc/assets/images/logo.png" />](https://bosctechlabs.com/)
