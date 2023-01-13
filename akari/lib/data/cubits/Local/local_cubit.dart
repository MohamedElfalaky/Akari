import 'package:akari/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  static LocalCubit get(context) => BlocProvider.of(context);

  String selectedLang1 =
      CacheHelper.getLangCode() == "en" ? "English" : "العربية";

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await CacheHelper.getLangCode();
    selectedLang1 = cachedLanguageCode == "en" ? "English" : "العربية";
    emit(ChangeLocaleState(local: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.saveToShared("LOCALE", languageCode);
    selectedLang1 = languageCode == "en" ? "English" : "العربية";
    emit(ChangeLocaleState(local: Locale(languageCode)));
  }
}
