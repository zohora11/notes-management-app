import 'package:flutter/material.dart';

/// A simple global notifier that holds the current theme mode
/// (light or dark) and notifies listeners when it changes.
/// This lets us toggle the theme from anywhere in the app
/// without needing a state management package.
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void toggleTheme() {
  themeNotifier.value =
  themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}