import 'package:flutter/material.dart';
import 'package:gardening_shop/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Earthly',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        fontFamily: 'Quicksand',
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all(Colors.grey.shade500)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>Home(),
      },
    );
  }
}
