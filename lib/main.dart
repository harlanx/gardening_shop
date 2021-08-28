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
        scrollbarTheme: ScrollbarThemeData(
          trackColor: MaterialStateProperty.all(Colors.white),
          thumbColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.hovered) && !states.contains(MaterialState.dragged)) {
                return Color(0xFFA8A8A8);
              }
              if (states.containsAll([MaterialState.hovered, MaterialState.dragged])) {
                return Color(0xFF787878);
              }
              return Color(0xFFC1C1C1);
            },
          ),
          isAlwaysShown: true,
          showTrackOnHover: true
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
