import 'package:flutterinaja/apps/shared/model/warning_sign.dart';
import 'package:flutterinaja/apps/shared/utils/password_validator/password_validator_unit.dart';

final class PasswordValidatorImpl_V1 implements PasswordValidator {
  //
  @override
  List<WarningSign> validatePassword(String text) {
    var warningSigns = [
      MinCharWarning(message: 'Minimal 8 karakter', isError: true),
      LowerCaseLetterSign(message: 'Ada huruf kecil', isError: true),
      UppercaseLetterSign(message: 'Ada huruf besar', isError: true),
    ];

    if (text.length >= 8) {
      warningSigns[0] = MinCharWarning(
        message: warningSigns.first.message,
        isError: false,
      );
    }

    final lowerCaseRegex = RegExp(r'[a-z]');
    if (lowerCaseRegex.hasMatch(text)) {
      warningSigns[1] = LowerCaseLetterSign(
        message: warningSigns[1].message,
        isError: false,
      );
    }

    final upperCaseRegex = RegExp(r'[A-Z]');
    if (upperCaseRegex.hasMatch(text)) {
      warningSigns[2] = UppercaseLetterSign(
        message: warningSigns[2].message,
        isError: false,
      );
    }

    return warningSigns;
  }
}
