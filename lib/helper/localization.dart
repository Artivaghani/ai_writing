// import 'package:aismarttonemail/utils/config_packages.dart';

class LocalizationHelper {
//   static loadTranslations() async {
//     List<LanguageModel> languageList = StorageHelper().getLanguageData;
//     Map<String, Map<String, String>> langauges = {};
//     for (int i = 0; i < languageList.length; i++) {
//       String data = await rootBundle.loadString(languageList[i].assetpath!);
//       Map tempData = jsonDecode(data);
//       Map<String, String> jsonResult = tempData.map((key, value) => MapEntry(key, value?.toString() ?? ""));
//       langauges.addAll({languageList[i].code!: jsonResult});
//     }
//     Get.addTranslations(langauges);
//     Get.updateLocale(Locale(StorageHelper().getSelectedLanguage));
//   }

//   static List<Map> langauges = [
//     {
//       "code": "en",
//       "assetpath": "assets/locale/english_en.json",
//       "name": "English",
//       "flagpath": "assets/flags/English.png",
//     },
//     {
//       "code": "de",
//       "assetpath": "assets/locale/german_de.json",
//       "name": "German",
//       "flagpath": "assets/flags/German.png",
//     },
//     {
//       "code": "es",
//       "assetpath": "assets/locale/spanish_es.json",
//       "name": "Spanish",
//       "flagpath": "assets/flags/spanish.png",
//     },
//     {
//       "code": "fr",
//       "assetpath": "assets/locale/french_fr.json",
//       "name": "French",
//       "flagpath": "assets/flags/French.png",
//     },
//     {
//       "code": "it",
//       "assetpath": "assets/locale/italian_it.json",
//       "name": "Italian",
//       "flagpath": "assets/flags/Italian.png",
//     },
//     {
//       "code": "pl",
//       "assetpath": "assets/locale/polish_pl.json",
//       "name": "Polish",
//       "flagpath": "assets/flags/Polish.png",
//     },
//     {
//       "code": "nl",
//       "assetpath": "assets/locale/dutch_nl.json",
//       "name": "Dutch",
//       "flagpath": "assets/flags/Dutch.png",
//     },
//     {
//       "code": "da",
//       "assetpath": "assets/locale/danish_da.json",
//       "name": "danish",
//       "flagpath": "assets/flags/denmark.png",
//     },
//     {
//       "code": "fil",
//       "assetpath": "assets/locale/filipina_fil.json",
//       "name": "Filipina",
//       "flagpath": "assets/flags/Philippines.png",
//     },
//     {
//       "code": "fi",
//       "assetpath": "assets/locale/finnish_fi.json",
//       "name": "Finnish",
//       "flagpath": "assets/flags/Finland.png",
//     },
//     {
//       "code": "hi",
//       "assetpath": "assets/locale/hindi_hi.json",
//       "name": "Hindi",
//       "flagpath": "assets/flags/India.png",
//     },
//     {
//       "code": "id",
//       "assetpath": "assets/locale/Indonesian_id.json",
//       "name": "Indonesian",
//       "flagpath": "assets/flags/Indonesia.png",
//     },
//     {
//       "code": "lb",
//       "assetpath": "assets/locale/luxembourgush_lb.json",
//       "name": "luxembourgush",
//       "flagpath": "assets/flags/Luxembourg.png",
//     },
//     {
//       "code": "no",
//       "assetpath": "assets/locale/norwegian_no.json",
//       "name": "norwegian",
//       "flagpath": "assets/flags/Norway.png",
//     },
//   ];

  static List<Map> emailGenLang = [
    {
      "code": "en",
      "assetpath": "assets/locale/english_en.json",
      "name": "English",
      "flagpath": "assets/flags/English.png",
    },
    {
      "code": "de",
      "assetpath": "assets/locale/german_de.json",
      "name": "German",
      "flagpath": "assets/flags/German.png",
    },
    {
      "code": "es",
      "assetpath": "assets/locale/spanish_es.json",
      "name": "Spanish",
      "flagpath": "assets/flags/spanish.png",
    },
    {
      "code": "fr",
      "assetpath": "assets/locale/french_fr.json",
      "name": "French",
      "flagpath": "assets/flags/French.png",
    },
    {
      "code": "it",
      "assetpath": "assets/locale/italian_it.json",
      "name": "Italian",
      "flagpath": "assets/flags/Italian.png",
    },
    {
      "code": "pl",
      "assetpath": "assets/locale/polish_pl.json",
      "name": "Polish",
      "flagpath": "assets/flags/Polish.png",
    },
    {
      "code": "nl",
      "assetpath": "assets/locale/dutch_nl.json",
      "name": "Dutch",
      "flagpath": "assets/flags/Dutch.png",
    }
  ];
}
