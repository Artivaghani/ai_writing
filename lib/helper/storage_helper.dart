import 'dart:convert';
import 'package:ai_writing/screens/login_screen/login_model.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {
  get storage => GetStorage();

  set saveTheme(bool value) => storage.write("isDark", value);
  bool? get getTheme => storage.read('isDark');

  removeUser() {
    storage.remove('isLoggedIn');
    storage.remove('loginData');
  }

  set isLoggedIn(bool value) => storage.write("isLoggedIn", value);
  bool get isLoggedIn => storage.read('isLoggedIn') ?? false;

  set isNewUser(bool value) => storage.write("isNew", value);
  bool get isNewUser => storage.read('isNew') ?? true;

  set loginData(LoginData data) =>
      storage.write("loginData", json.encode(data));

  LoginData get loginData {
    final parsed = json.decode(storage.read("loginData") ?? "{}");
    return LoginData.fromJson(parsed);
  }

  // List<LanguageModel> get getLanguageData {
  //   return languageModelFromJson(jsonEncode(LocalizationHelper.langauges));
  // }

  // set saveSelectedLanguage(String languageCode) => storage.write("selectedLanguage", languageCode);

  // String get getSelectedLanguage => storage.read("selectedLanguage") ?? "en";
}
