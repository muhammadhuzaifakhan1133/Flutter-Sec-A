import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          child: Text("Set locale to German"),
          onPressed: () => MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'de')),
        ),
        TextButton(
          child: Text("Set locale to English"),
          onPressed: () => MyApp.of(context).setLocale(Locale.fromSubtags(languageCode: 'en')),
        ),
      ],
    );
  }
}