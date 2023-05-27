import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/app_widgets/common_text_field.dart';
import 'package:ai_writing/screens/credit_history_screen/credit_View.dart';
import 'package:ai_writing/screens/credit_history_screen/credit_history_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class CreditHistoryScreen extends StatelessWidget {
  CreditHistoryScreen({super.key});

  CreditHistoryController controller = Get.put(CreditHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration,
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: ListView(
            children: [
              CommonAppBar(title: AppString.creditHistory),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                child: Text(AppString.keyPoint),
              ),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const CreditView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
