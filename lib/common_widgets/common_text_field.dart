import 'package:ai_writing/utils/config_packages.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  String? hintText;
  int? maxLines;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  TextStyle? style;
  CommonTextField(
      {super.key,
      this.controller,
      this.validator,
      this.onChanged,
      this.maxLines,
      this.maxLength,
      this.inputFormatters,
      this.style,
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
        inputFormatters: inputFormatters,
        style: style ?? Get.theme.textTheme.headlineSmall,
        maxLength: maxLength,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Get.theme.textTheme.bodyMedium),
      ),
    ));
  }
}
