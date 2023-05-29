import 'package:ai_writing/app_widgets/btn_view.dart';
import 'package:ai_writing/screens/generate_screen.dart/generate_screen.dart';
import 'package:ai_writing/screens/home_screen/category_model.dart';
import 'package:ai_writing/screens/review_and_send_screen/review_and_send.dart';
import 'package:ai_writing/screens/writing_screen/email_view.dart';
import 'package:ai_writing/screens/writing_screen/writing_controller.dart';
import 'package:ai_writing/utils/config_packages.dart';

class WritingScreen extends StatelessWidget {
  final CategoryData categoryData;
  WritingScreen({super.key, required this.categoryData});

  WritingController controller = Get.put(WritingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.backroundDecoration,
        padding: EdgeInsets.all(AppDimen.dimen16),
        width: double.infinity,
        child: SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonAppBar(title: categoryData.title.toString()),
                Padding(
                  padding: EdgeInsets.only(
                      top: AppDimen.dimen20, bottom: AppDimen.dimen10),
                  child: Text(categoryData.description.toString()),
                ),
                TabBar(
                  indicatorColor: Get.theme.primaryColor,
                  labelStyle: Get.theme.textTheme.headlineMedium,
                  unselectedLabelStyle: Get.theme.textTheme.bodyLarge,
                  labelColor: Get.theme.textTheme.headlineMedium!.color,
                  tabs: [
                    Tab(
                        icon: Text(categoryData.slug.toString() == Slug.email
                            ? AppString.freeEmail
                            : AppString.freeProposal)),
                    Tab(
                        icon: Text(categoryData.slug.toString() == Slug.email
                            ? AppString.yourEmails
                            : AppString.yourProposal)),
                  ],
                  onTap: (value) {},
                ),
                Expanded(
                    child: Obx(() => controller.selectTab.value == 0
                        ? ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () =>
                                    Get.to(const ReviewAndSendScreen()),
                                child: EmailView()),
                          )
                        : Container()))
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(GenerateScreen()),
        child: ButtonView(
          title: AppString.aiemail,
          height: AppDimen.dimen70,
          width: AppDimen.dimen180,
          icon: Icon(
            Icons.edit,
            size: AppDimen.dimen20,
            color: Get.theme.cardColor,
          ),
        ),
      ),
    );
  }
}
