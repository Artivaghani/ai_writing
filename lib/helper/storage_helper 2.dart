// import 'dart:developer';
// import 'package:aismarttonemail/helper/localization.dart';
// import 'package:aismarttonemail/utils/config_packages.dart';

// class StorageHelper {
//   get storage => GetStorage();

//   set saveTheme(bool value) => storage.write("islight", value);

//   removeUser() {
//     storage.remove('isLoggedIn');
//     storage.remove('loginData');
//   }

//   bool? get getTheme => storage.read('islight');

//   set saveIsLoggedIn(bool value) => storage.write("isLoggedIn", value);

//   bool get getIsLoggedIn => storage.read('isLoggedIn') ?? false;

//   set isNewUser(bool value) => storage.write("isNew", value);

//   bool get isNewUser => storage.read('isNew') ?? true;

//   set loginData(UserData data) => storage.write("loginData", json.encode(data));

//   UserData get loginData {
//     final parsed = json.decode(storage.read("loginData") ?? "{}");
//     return UserData.fromJson(parsed);
//   }

//   set saveStaticDataId(String id) => storage.write("staticDataId", id);

//   get getStaticDataId => storage.read("staticDataId") ?? "";

//   set setStaticData(StaticData data) => storage.write("staticData", json.encode(data));

//   StaticData get getStaticData {
//     final parsed = json.decode(storage.read("staticData") ?? "{}");
//     log("$parsed");
//     return StaticData.fromJson(parsed);
//   }

//   List<LanguageModel> get getLanguageData {
//     return languageModelFromJson(jsonEncode(LocalizationHelper.langauges));
//   }

//   set saveSelectedLanguage(String languageCode) => storage.write("selectedLanguage", languageCode);

//   String get getSelectedLanguage => storage.read("selectedLanguage") ?? "en";
// }
