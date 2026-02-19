import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _localeKey = 'app_locale';

class LocaleNotifier extends Notifier<Locale?> {
  @override
  Locale? build() {
    _loadSavedLocale();
    return null; // Start with system locale
  }

  Future<void> _loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLocale = prefs.getString(_localeKey);
    if (savedLocale != null) {
      state = Locale(savedLocale);
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    state = locale;
  }

  Future<void> clearLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
    state = null;
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale?>(
  LocaleNotifier.new,
);

// Provider to initialize locale from storage on app start
final localeInitializerProvider = FutureProvider<Locale?>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final savedLocale = prefs.getString(_localeKey);
  if (savedLocale != null) {
    return Locale(savedLocale);
  }
  return null;
});
