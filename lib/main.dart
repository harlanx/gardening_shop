import 'package:flutter/material.dart';
import 'package:gardening_shop/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          trackColor: WidgetStateProperty.all(Colors.white),
          thumbColor: WidgetStateProperty.resolveWith(
            (states) {
              if (states.contains(WidgetState.hovered) &&
                  !states.contains(WidgetState.dragged)) {
                return const Color(0xFFA8A8A8);
              }
              if (states
                  .containsAll([WidgetState.hovered, WidgetState.dragged])) {
                return const Color(0xFF787878);
              }
              return const Color(0xFFC1C1C1);
            },
          ),
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(true),
        ),
      ),
      initialRoute: '',
      routes: {
        '': (context) => const Home(),
      },
    );
  }
}
