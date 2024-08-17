import 'package:flutter/material.dart';
import 'package:gardening_shop/screens/home.dart';

import '../data/app_data.dart';

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
      theme: ThemeData(
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppData.color,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppData.color,
          brightness: Brightness.dark,
        ),
      ),
      initialRoute: '',
      routes: {
        '': (context) => const Home(),
      },
    );
  }
}
