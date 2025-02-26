import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_number_country_formatter.dart';

final class PhoneNumberCountryFormatterImpl implements PhoneNumberCountryFormatter {
  @override
  String formatPhoneInput({
    required String countryCode,
    required String phoneInput,
  }) {
    if (countryCode.isEmpty) {
      return '';
    }

    if (phoneInput.isEmpty) {
      return '';
    }

    final countryCodeLength = countryCode.length;
    final prefixCountryCode = phoneInput.substring(0, countryCodeLength);
    final trimmedString = phoneInput.substring(countryCodeLength, phoneInput.length);

    if (prefixCountryCode == countryCode) {
      return '0$trimmedString';
    }

    final removedLeadingZero = phoneInput.replaceFirst(RegExp(r'^0+'), '');
    return '0$removedLeadingZero';
  }
}
