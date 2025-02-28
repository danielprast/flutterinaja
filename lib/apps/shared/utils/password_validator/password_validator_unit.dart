import 'package:flutterinaja/apps/shared/model/warning_sign.dart';

abstract class PasswordValidator {
  List<WarningSign> validatePassword(String text);
}
