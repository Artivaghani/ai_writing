import 'package:ai_writing/common_dialogs/micro_view/micro_controller.dart';
import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/utils/config_packages.dart';

class MicroView extends StatelessWidget {
  final Function onTap;
  MicroView({Key? key, required this.onTap}) : super(key: key);

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
      padding: EdgeInsets.all(AppDimen.dimen16),
      width: double.infinity,
      height: AppDimen.dimen200,
      child: Column(
        children: [
          Image.asset(
            AppImages.logo,
            width: AppDimen.dimen50,
            height: AppDimen.dimen50,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: AppDimen.dimen10, bottom: AppDimen.dimen10),
            child: Text(AppString.listerning),
          ),
          SizedBox(
            height: AppDimen.dimen10,
          ),
          InkWell(
            onTap: () => microController.stopListening(),
            child: Align(
              alignment: Alignment.center,
              child: ButtonView(
                title: AppString.stop,
                height: AppDimen.dimen60,
                width: AppDimen.dimen150,
              ),
            ),
          )
        ],
      ),
    );
  }
}
