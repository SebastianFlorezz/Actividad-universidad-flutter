import 'package:flutter/material.dart';

import 'screens/registro_compra_screen.dart';

void main() {
  runApp(const CompraApp());
}

class CompraApp extends StatelessWidget {
  const CompraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compra Clara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF167D72),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F6F4),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD9E2DE)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFD9E2DE)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF167D72), width: 1.5),
          ),
        ),
      ),
      home: const RegistroCompraScreen(),
    );
  }
}
