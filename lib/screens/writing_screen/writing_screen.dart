import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/screens/writing_screen/email_view.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class WritingScreen extends StatelessWidget {
  WritingScreen({super.key});

  WritingController controller = Get.put(WritingController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          decoration: AppDecoration.backroundDecoration,
          padding: EdgeInsets.all(AppDimen.dimen16),
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                CommonAppBar(title: 'Email writing'),
                TabBar(
                  indicatorColor: Get.theme.primaryColor,
                  labelStyle: Get.theme.textTheme.headlineMedium,
                  unselectedLabelStyle: Get.theme.textTheme.bodyLarge,
                  labelColor: Get.theme.textTheme.headlineMedium!.color,
                  tabs: [
                    Tab(icon: Text(AppString.freeEmail)),
                    Tab(icon: Text(AppString.yourEmails)),
                  ],
                  onTap: (value) {},
                ),
                Expanded(
                    child: Obx(() => controller.selectTab == 0
                        ? ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => EmailView(),
                          )
                        : Container()))
              ],
            ),
          ),
        ),
        floatingActionButton:  ButtonView(
          title: 'Ai Email',
          height: AppDimen.dimen60,
          width: AppDimen.dimen150,
        ),
      ),
    );
  }
}
