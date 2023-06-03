import 'package:ai_writing/utils/config_packages.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MicroController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  void initSpeech(Function onTap) async {
    speechEnabled = await speechToText.initialize();
    await speechToText.listen(
      onResult: (result) {
        lastWords = result.recognizedWords;
        print('last worlds $lastWords');
        onTap.call(lastWords);
        update();
      },
    );
  }

  void stopListening() async {
    await speechToText.stop();
    Get.back();
  }
}
