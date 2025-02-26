import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_number_formatter.dart';
import 'package:flutterinaja/apps/shared/utils/tlog.dart';

class PhoneFormatterImpl implements PhoneNumberFormatter {
  PhoneFormatterImpl();

  @override
  String formatPhoneInput(String phoneInput) {
    final countryCode = '+62';
    final countryCodeLength = countryCode.length;
    final prefixCountryCode = phoneInput.substring(0, countryCodeLength);
    final trimmedString = phoneInput.substring(countryCodeLength, phoneInput.length);
    final firstCharacter = phoneInput.substring(0, 1);
    tlog('prefix code', prefixCountryCode);
    tlog('trimmed phone', trimmedString);
    tlog('first char', firstCharacter);

    if (prefixCountryCode == countryCode) {
      return '0$trimmedString';
    }

    final removedLeadingZero = phoneInput.replaceFirst(RegExp(r'^0+'), '');
    return '0$removedLeadingZero';
  }
}
