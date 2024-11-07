import 'package:flutter/material.dart';
import 'package:spatial/style/colors.dart';

appTheme(BuildContext context){
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: kColorAccent),
    useMaterial3: true,
  );
}