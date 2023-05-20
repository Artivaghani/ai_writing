import 'package:ai_writing/utils/config_packages.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        key: controller.scaffoldKey,
        appBar: CommonAppBar(
          leading: GestureDetector(
            onTap: () {
              if (controller.scaffoldKey.currentState!.isDrawerOpen) {
                controller.scaffoldKey.currentState!.openEndDrawer();
              } else {
                controller.scaffoldKey.currentState!.openDrawer();
              }
            },
            child: Icon(Icons.menu, color: Theme.of(context).iconTheme.color),
          ),
          title: Text(AppString.dashBoard),
          refresh: () {
            controller.initData();
          },
        ),
        drawer: Appdrawer(),
        body: GetBuilder<HomeController>(
            builder: (controller) => controller.isLoading
                ? AppCommonWidgets.processIntegrator
                : controller.getData == null || controller.getData!.list!.isEmpty
                    ? AppCommonWidgets.datanotfoundtext()
                    : ListView.builder(
                        itemCount: controller.getData!.list!.length,
                        itemBuilder: (context, index) {
                          return HomeCardWidget(dataList: controller.getData!.list![index], index: index);
                        },
                      )));
  }
}
