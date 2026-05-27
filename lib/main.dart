import 'package:flutter/material.dart';
import 'screens/services_page.dart';

void main() {
  runApp(const Teste01App());
}

class Teste01App extends StatelessWidget {
  const Teste01App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste01 - M-Pesa Integration',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB1DC27)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
      ),
      home: const ServicesPage(),
    );
  }
}
