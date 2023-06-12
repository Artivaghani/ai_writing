import 'package:ai_writing/utils/config_packages.dart';

class ApiParam {
  static const String name = "name";
  static const String id = "id";
  static const String email = "email";
  static const String profile = "profile";
  static const String provider = "provider";
  static const String devicetoken = "device_token";
  static const String deviceType = "device_type";
  static const String action = "action";
  static const String prompt = "prompt";
  static const String tone = "tone";
  static const String length = "length";
  static const String level = "level";
  static const String isemoji = "is_emoji";
  static const String file = "file";
  static const String lang = "lang";
  static const String appversion = "app_version";
  static const String privacypolicy = "privacy-policy";
  static const String termconditions = "term-conditions";
  static const String refundpolicy = "refund-policy";
  static const String about = "about";
  static const String isAdsReward = "is_ads_reward";
  static const String reGenerate = "regenerate";
  static const String subscriptionPlan = "subscription_plan";
  static const String purchaseToken = "purchase_token";
  static const String price = "price";


  static Map<String, String> header = {
    // 'Content-Type': 'application/json',
    // 'Accept': 'application/json',
    'Authorization': 'Bearer ${StorageHelper().loginData.authtoken}',
  };
}

class Slug {
  static const String email = "email";
  static const String proposal = "proposal";
  static const String speechText = "speech-to-text";
  static const String grammerly = "grammerly";
}
