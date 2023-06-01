import 'package:ai_writing/common_widgets/btn_view.dart';
import 'package:ai_writing/utils/config_packages.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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
              const CommonAppBar(title: ''),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppString.amazing,
                    style: Get.theme.textTheme.headlineLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${AppString.pro}',
                          style: Get.theme.textTheme.headlineLarge!
                              .copyWith(fontWeight: FontWeight.w700)),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: AppDimen.dimen20, bottom: AppDimen.dimen40),
                child: Text(
                  AppString.loginMsg,
                  textAlign: TextAlign.center,
                ),
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppDimen.dimen50),
                    child: AppCommonWidgets.commonCard(Padding(
                      padding: EdgeInsets.only(
                          top: AppDimen.dimen60,
                          left: AppDimen.dimen20,
                          right: AppDimen.dimen20,
                          bottom: AppDimen.dimen20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
                            getSubscriptionCard(),
                      ),
                    )),
                  ),
                  Image.asset(
                    AppImages.logo,
                    width: AppDimen.dimen100,
                    height: AppDimen.dimen100,
                  )
                ],
              ),
              SizedBox(
                height: AppDimen.dimen30,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: ButtonView(
                    title: AppString.generate,
                    height: AppDimen.dimen70,
                    width: AppDimen.dimen250,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getSubscriptionCard() => AppCommonWidgets.commonCard(
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimen.dimen22, vertical: AppDimen.dimen22),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good'),
                  SizedBox(
                    height: AppDimen.dimen8,
                  ),
                  Text(
                    '20/-',
                    style: Get.theme.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  '20',
                  style: Get.theme.textTheme.headlineMedium,
                ),
                SizedBox(
                  width: AppDimen.dimen8,
                ),
                Image.asset(
                  AppImages.credit,
                  width: AppDimen.dimen30,
                  height: AppDimen.dimen30,
                )
              ],
            )
          ],
        ),
      ),
      side: BorderSide(color: Get.theme.primaryColor, width: 1));
}
