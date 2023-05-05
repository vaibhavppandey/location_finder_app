import 'package:flutter/material.dart';
import 'package:http_sth/src/pages/current_location_page.dart'
    show CurrentLocationPage;

class NameToBeDecidedApp extends StatelessWidget {
  const NameToBeDecidedApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Futter WebApp',
      debugShowCheckedModeBanner: true,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey.shade600, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const CurrentLocationPage(),
    );
  }
}
