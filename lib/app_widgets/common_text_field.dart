import 'package:ai_writing/utils/config_packages.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  String? hintText;
  int? maxLines;
  int? maxLength;
  CommonTextField(
      {super.key,
      this.controller,
      this.validator,
      this.onChanged,
      this.maxLines,
      this.maxLength,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return AppCommonWidgets.commonCard(Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppDimen.dimen8, horizontal: AppDimen.dimen16),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        style: Get.theme.textTheme.headlineSmall,
       maxLength: maxLength,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Get.theme.textTheme.bodyMedium),
      ),
    ));
  }
}
