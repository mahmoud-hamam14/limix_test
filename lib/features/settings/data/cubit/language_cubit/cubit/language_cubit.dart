
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. حالات اللغة
abstract class LocaleState {}
class SelectedLocale extends LocaleState {
  final Locale locale;
  SelectedLocale(this.locale);
}

// 2. الكيوبت نفسه
class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(SelectedLocale(const Locale('en'))); // اللغة الافتراضية إنجليزي

  // دالة لتغيير اللغة
  void changeLanguage() {
    if ((state as SelectedLocale).locale.languageCode == 'en') {
      emit(SelectedLocale(const Locale('ar')));
    } else {
      emit(SelectedLocale(const Locale('en')));
    }
  }
}
