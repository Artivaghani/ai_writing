import 'package:ai_writing/helper/localization.dart';
import 'package:ai_writing/utils/config_packages.dart';

class GenerateController extends GetxController
{
  RxInt selectTab=0.obs;
  RxBool isChecked=false.obs;
  
  Map selectedLang=LocalizationHelper.emailGenLang[0];

}