import 'package:ai_writing/helper/localization_model.dart';
import 'package:ai_writing/utils/app_strings.dart';

class AppConst {
  static const String appName = 'Ai Writing';
  static const String apkName = 'com.avcodes.ai_writing';

  static bool isAdShow = true;

  static const double elevation = 2;
  static const double cardRadius = 14;
  static const double btnRadius = 10;

//Test net
  // static const String androidBannerId =
  //     'ca-app-pub-3940256099942544/6300978111';
  // static const String androidInterstrialId =
  //     'ca-app-pub-3940256099942544/1033173712';
  // static const String androidRevordeId =
  //     'ca-app-pub-3610650832315671/3985563928';
  // static const String androidOpenId = 'ca-app-pub-3940256099942544/3419835294';

//Test net
  static const String iosBannerId = 'ca-app-pub-3940256099942544/6300978111';
  static const String iosInterstrialId =
      'ca-app-pub-3940256099942544/1033173712';
  static const String iosRevordeId = 'ca-app-pub-3940256099942544/5224354917';
  static const String iosOpenId = 'ca-app-pub-3940256099942544/3419835294';

//Live
  static const String androidBannerId =
      'ca-app-pub-7484057413460570/2113260812';
  static const String androidInterstrialId =
      'ca-app-pub-7484057413460570/9656693003';
  static const String androidRevordeId =
      'ca-app-pub-7484057413460570/5722113583';
  static const String androidOpenId = 'ca-app-pub-7484057413460570/3234770792';

  static const String androidClientID =
      '484500304504-1pjc2cuqo51suq7ondk5bhsgutljm2f5.apps.googleusercontent.com';
  static const String iosClientID = '';

  static const String playStoreLink =
      'https://play.google.com/store/apps/details?id=$apkName';
  static const String appStoreLink = '';

  static List<String> length = [
    AppString.short,
    AppString.medium,
    AppString.long
  ];

  static List<String> level = [
    AppString.none,
    AppString.optimal,
    AppString.high
  ];

  static Set<String> productPlan = {"silver_50", "gold_100", "platinum_200"};

  static List<int> lengthText = [250, 500, 750];

  static List<ToneModel> toneList = [
    ToneModel(name: 'Appreciative', assetpath: 'assets/tone/ico_2.png'),
    // ToneModel(name: 'Assertive', assetpath: 'assets/tone/ico_3.png'),
    // ToneModel(name: 'Awestruck', assetpath: 'assets/tone/ico_4.png'),
    // ToneModel(name: 'Candid', assetpath: 'assets/tone/ico_5.png'),
    ToneModel(name: 'Casual', assetpath: 'assets/tone/ico_6.png'),
    // ToneModel(name: 'Cautionary', assetpath: 'assets/tone/ico_7.png'),
    // ToneModel(name: 'Compassionate', assetpath: 'assets/tone/ico_8.png'),
    ToneModel(name: 'Convincing', assetpath: 'assets/tone/ico_9.png'),
    ToneModel(name: 'Critical', assetpath: 'assets/tone/ico_10.png'),
    // ToneModel(name: 'Earnest', assetpath: 'assets/tone/ico_11.png'),
    // ToneModel(name: 'Enthusiastic', assetpath: 'assets/tone/ico_12.png'),
    ToneModel(name: 'Formal', assetpath: 'assets/tone/ico_13.png'),
    ToneModel(name: 'Funny', assetpath: 'assets/tone/ico_14.png'),
    // ToneModel(name: 'Humble', assetpath: 'assets/tone/ico_15.png'),
    // ToneModel(name: 'Humorous', assetpath: 'assets/tone/ico_16.png'),
    // ToneModel(name: 'Informative', assetpath: 'assets/tone/ico_17.png'),
    // ToneModel(name: 'Inspirational', assetpath: 'assets/tone/ico_18.png'),
    ToneModel(name: 'Joyful', assetpath: 'assets/tone/ico_19.png'),
    // ToneModel(name: 'Passionate', assetpath: 'assets/tone/ico_20.png'),
    ToneModel(name: 'Thoughtful', assetpath: 'assets/tone/ico_21.png'),
    // ToneModel(name: 'Urgent', assetpath: 'assets/tone/ico_1.png'),
    ToneModel(name: 'Worried', assetpath: 'assets/tone/ico_22.png'),
  ];
}
