import 'package:ai_writing/app_dialogs/micro_screen/micro_controller.dart';
import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/utils/config_packages.dart';

class MictroScreen extends StatelessWidget {
  final Function onTap;
  MictroScreen({Key? key, required this.onTap}) : super(key: key);

  MicroController microController = Get.put(MicroController());

  @override
  StatelessElement createElement() {
    microController.initSpeech(onTap);
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.dialogBackroundDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.all(AppDimen.dimen20),
      width: double.infinity,
      height: AppDimen.dimen300,
      child: Column(
        children: [
          Image.asset(
            AppImages.logo,
            width: AppDimen.dimen100,
            height: AppDimen.dimen100,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppDimen.dimen20, bottom: AppDimen.dimen10),
            child: Text(AppString.listerning),
          ),
          SizedBox(
            height: AppDimen.dimen20,
          ),
          InkWell(
            onTap: () => microController.stopListening(),
            child: Align(
              alignment: Alignment.center,
              child: ButtonView(
                title: AppString.stop,
                height: AppDimen.dimen70,
                width: AppDimen.dimen200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
