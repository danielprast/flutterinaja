import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_input_validator.dart';

final class PhoneInputValidatorImpl implements PhoneInputValidator {
  PhoneInputValidatorImpl();

  @override
  bool validatePhoneInput(String phone) {
    final firstChar = phone.substring(0, 1);

    if (firstChar == '+') {
      return false;
    }

    if (firstChar == '0') {
      return false;
    }

    return true;
  }
}
