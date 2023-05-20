// import 'package:aismarttonemail/utils/config_packages.dart';

// enum ButtonEnum { outline, filled, text }

// class ButtonItem extends StatelessWidget {
//   final String text;
//   final Widget? backIicon;
//   final Widget? frontIcon;
//   final double? width;
//   final double? height;
//   final double? borderRadius;
//   double? fontSize;
//   final VoidCallback? onPressed;
//   FontStyle? fontStyle;
//   Color? color;
//   late final ButtonEnum buttonType;
//   final TextStyle? textStyle;
//   MainAxisAlignment? mainAxisAlignment;

//   static const double _defaultRadius = 10;

//   ButtonItem.outline({
//     Key? key,
//     required this.text,
//     this.backIicon,
//     this.borderRadius = _defaultRadius,
//     this.width,
//     this.textStyle,
//     this.frontIcon,
//     this.height,
//     required this.onPressed,
//   }) : super(key: key) {
//     buttonType = ButtonEnum.outline;
//   }

//   ButtonItem.filled({
//     Key? key,
//     required this.text,
//     this.backIicon,
//     this.width,
//     this.borderRadius = _defaultRadius,
//     this.fontSize,
//     this.frontIcon,
//     this.textStyle,
//     this.height,
//     this.color,
//     this.mainAxisAlignment,
//     required this.onPressed,
//   }) : super(key: key) {
//     buttonType = ButtonEnum.filled;
//   }

//   ButtonItem.text({
//     Key? key,
//     required this.text,
//     this.backIicon,
//     this.fontStyle,
//     this.frontIcon,
//     this.width,
//     this.fontSize,
//     this.borderRadius = _defaultRadius,
//     this.textStyle,
//     this.height,
//     required this.onPressed,
//   }) : super(key: key) {
//     buttonType = ButtonEnum.text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (buttonType) {
//       case ButtonEnum.outline:
//         return GestureDetector(
//           onTap: onPressed,
//           child: Container(
//             height: height ?? AppDimen.dimen80,
//             width: width ?? AppDimen.dimenW430,
//             padding: EdgeInsets.symmetric(horizontal: AppDimen.dimen15),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(borderRadius ?? 5),
//               border: Border.all(
//                   color: Theme.of(context).colorScheme.onSecondary, width: 1.5),
//             ),
//             child: Row(
//               mainAxisAlignment: backIicon == null
//                   ? MainAxisAlignment.center
//                   : MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 frontIcon == null ? const SizedBox.shrink() : frontIcon!,
//                 frontIcon == null
//                     ? const SizedBox.shrink()
//                     : SizedBox(width: AppDimen.dimen8),
//                 Flexible(
//                   child: Text(
//                     text,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: textStyle ??
//                         Get.theme.textTheme.bodySmall!.copyWith(
//                             color: Theme.of(context).colorScheme.background),
//                   ),
//                 ),
//                 backIicon == null
//                     ? const SizedBox.shrink()
//                     : SizedBox(width: AppDimen.dimen8),
//                 backIicon == null ? const SizedBox.shrink() : backIicon!
//               ],
//             ),
//           ),
//         );

//       case ButtonEnum.filled:
//         return GestureDetector(
//           onTap: onPressed,
//           child: Container(
//             height: height ?? AppDimen.dimen80,
//             width: width ?? AppDimen.dimenW430,
//             padding: EdgeInsets.symmetric(horizontal: AppDimen.dimen20),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(borderRadius ?? 5),
//                 border: Border.all(color: Get.theme.primaryColor, width: 0.5),
//                 color: color ?? Get.theme.primaryColor),
//             child: Row(
//               mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Flexible(
//                   flex: 1,
//                   child: Text(
//                     text,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     style: textStyle ?? commonText18500,
//                   ),
//                 ),
//                 backIicon == null
//                     ? const SizedBox.shrink()
//                     : SizedBox(width: AppDimen.dimen4),
//                 backIicon == null ? const SizedBox.shrink() : backIicon!
//               ],
//             ),
//           ),
//         );

//       case ButtonEnum.text:
//         return TextButton(
//           key: key,
//           onPressed: onPressed,
//           child: Text(
//             text,
//             overflow: TextOverflow.ellipsis,
//             style: Get.textTheme.titleLarge!.copyWith(
//               fontSize: fontSize ?? FontDimen.dimen18,
//               fontStyle: fontStyle ?? FontStyle.normal,
//               decoration: TextDecoration.underline,
//             ),
//           ),
//         );
//     }
//   }
// }
