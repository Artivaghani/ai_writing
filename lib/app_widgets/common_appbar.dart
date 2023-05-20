import '../utils/config_packages.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({Key? key, this.title, this.leading, this.elevation = 0.0, this.refresh, this.isRefresh = true}) : super(key: key);

  final Widget? title;
  final Widget? leading;
  final double elevation;
  final VoidCallback? refresh;
  final bool isRefresh;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: leading,
        // GestureDetector(
        //     onTap: () => Get.back(),
        //     child: Icon(
        //       Icons.arrow_back,
        //       color: Theme.of(context).iconTheme.color,
        //     )),
        title: title,
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.headline1,
       );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
