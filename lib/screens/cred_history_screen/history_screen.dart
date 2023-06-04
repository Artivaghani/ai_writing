import 'package:ai_writing/screens/cred_history_screen/credit_View.dart';
import 'package:ai_writing/screens/cred_history_screen/history_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration(),
        padding: EdgeInsets.all(AppDimen.dimen20),
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              CommonAppBar(title: AppString.creditHistory),
              SizedBox(
                height: AppDimen.dimen10,
              ),
              Expanded(
                  child: GetBuilder<HistoryController>(
                      init: HistoryController(),
                      builder: (controller) => controller.isLoading
                          ? AppCommonWidgets.processIntegrator()
                          : controller.historyList.isEmpty
                              ? AppCommonWidgets.datanotfoundtext()
                              : ListView.builder(
                                  itemCount: controller.historyList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => CreditView(
                                      historyList:
                                          controller.historyList[index]),
                                )))
            ],
          ),
        ),
      ),
      bottomNavigationBar: AdHelper.bannerWidget(),
    );
  }
}