import 'package:ai_writing/screens/buy_history_screen/buy_history_controller.dart';
import 'package:ai_writing/screens/credit_history_screen/credit_View.dart';
import 'package:ai_writing/utils/config_packages.dart';

class BuyHistoryScreen extends StatelessWidget {
  BuyHistoryScreen({super.key});

  BuyHistoryController controller = Get.put(BuyHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: ListView(
            children: [
              CommonAppBar(title: AppString.buyHistory),
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
