
import 'package:ai_writing/utils/config_packages.dart';

class FieldValidator {
  static String? validateEmail(String? value) {

    if (value!.isEmpty) {
      return AppString.emailRequired;
    } else if (!value.isEmail) {
      return AppString.enterValidEmail;
      /*if (!regex.hasMatch(value.trim())) {
      return AppString.enterValidEmail;*/
    }

    return null;
  }

  static bool validatesPassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String? validateRegisterPassword(String? value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    bool validate = regExp.hasMatch(value!);
    if (validate) {
      return null;
    } else {
      return AppString.enterValidPassword;
    }
  }

  static String? validatePassword(String? value, String text) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return "Password is required";
    } else if (!regex.hasMatch(value)) {
      return text;
    }
    return null;
  }

  static String? newValidatePassword(String? value) {
    if (value!.isEmpty) {
      return "New Password is required";
    } else if (value.length < 8) {
      return "Password must have minimum eight characters";
    }
    return null;
  }

  static String? validateValueIsEmpty(String? value, String text) {
    if (value!.isEmpty) {
      return text;
    }
    return null;
  }

  static String? validateValueEmpty(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Value";
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value!.isEmpty) {
      return "Amount is required";
    } else if (value.isAlphabetOnly) {
      return " Validate Only digits";
    }
    return null;
  }

  static String? validateLocalAmount(String? value, String balance) {
    if (value!.isEmpty) {
      return "Please Enter Amount";
    } else if (double.parse(value) <= 0) {
      return "Enter Valid Amount";
    } else if (double.parse(balance) < double.parse(value)) {
      return "Value can't be more then balance";
    }
    return null;
  }

  static String? validateOtp(String value) {
    if (value.isEmpty) {
      return "OTP is required";
    } else if (value.length != 6) {
      return "OTP must have 6 digits";
    } else if (value.isAlphabetOnly) {
      return " Validate Only digits";
    }
    return null;
  }

  static String? validateWithdrawAddress(String? value) {
    if (value!.isEmpty) {
      return 'Address is required';
    } else if (value.length < 34) {
      return 'Enter valid address';
    }
    return null;
  }
}
