import 'package:flutter/material.dart';
import 'package:spatial/style/colors.dart';

appTheme(BuildContext context){
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kColorAccent),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: kColorSecondary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: kColorSecondary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
    )
  );
}