import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get darkTheme => ThemeData(
      primarySwatch: Colors.grey,
      colorScheme: const ColorScheme.dark(
        primary: Colors.grey,
        secondary: Colors.red,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.blueGrey),
        labelStyle: TextStyle(color: Colors.white),
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 18),
        ).titleLarge,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    );
