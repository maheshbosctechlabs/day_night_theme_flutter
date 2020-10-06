import 'package:day_night_theme_flutter/day_night_theme_flutter.dart';
import 'package:flutter/material.dart';

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
      sunriseHour: 13,
      sunriseMinutes: 22,
      // sunset time in 24 hours format
      sunsetHour: 13,
      sunsetMinutes: 23,
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
