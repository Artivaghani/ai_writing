import 'package:ai_writing/utils/config_packages.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MicroController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  String lastWords = '';

  void initSpeech(Function onTap) async {
    await speechToText.initialize(finalTimeout: const Duration(minutes: 10));
    await speechToText.listen(
        onResult: (result) {
          lastWords = result.recognizedWords;

          onTap.call(lastWords);
          update();
          if (result.finalResult) {
            stopListening();
          }
        },
        listenMode: ListenMode.deviceDefault,
        listenFor: const Duration(minutes: 10),
        pauseFor: const Duration(seconds: 20));

    Future.delayed(
      const Duration(seconds: 5),
      () {
        if (lastWords.isEmpty) {
          stopListening();
        }
      },
    );
  }

  void stopListening() async {
    await speechToText.stop();
    Get.back();
  }
}
