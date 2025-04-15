import 'package:flutter/material.dart';

ThemeData theme() => ThemeData(
  fontFamily: 'Mulish',
  appBarTheme: appBarTheme(),

);

AppBarTheme appBarTheme() => AppBarTheme(
  elevation: 0.0,
  centerTitle: true,
);