import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    primarySwatch: Colors.green,
    colorScheme: ThemeData.light()
        .colorScheme
        .copyWith(primary: Colors.green, secondary: Colors.green),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.green),
        unselectedIconTheme: IconThemeData(color: Colors.black87),
        unselectedLabelStyle:
            TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.green,
        selectedLabelStyle:
            TextStyle(color: Colors.green, fontWeight: FontWeight.w500)),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      colorScheme: const ColorScheme.light(
        background: Color(0xFF53B175),
        primary: Color(0xFF53B175),
      ),
    ));

const inputBorder =
    UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12));

const bottomNavigationBarBorder = BorderRadius.only(
    topLeft: Radius.circular(16), topRight: Radius.circular(16));
