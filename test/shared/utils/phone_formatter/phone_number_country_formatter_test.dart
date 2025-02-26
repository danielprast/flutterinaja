import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_formatter.dart';

void main() {
  PhoneNumberCountryFormatter makeSUT() {
    return PhoneNumberCountryFormatterImpl();
  }

  test(
    'Test with empty country code, number 9876, should return empty string',
        () {
      final expected = '';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(countryCode: '', phoneInput: '9876');
      expect(result, expected);
    },
  );

  test(
    'Test with country code +62, empty number, should return empty string',
        () {
      final expected = '';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(countryCode: '+62', phoneInput: '');
      expect(result, expected);
    },
  );

  test(
    'Test with country code +63, number 9876, should return 09876',
        () {
      final expected = '09876';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(countryCode: '+63', phoneInput: '9876');
      expect(result, expected);
    },
  );

  test(
    'Test with country code +63, number +639876, should return 09876',
    () {
      final expected = '09876';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(countryCode: '+63', phoneInput: '+639876');
      expect(result, expected);
    },
  );

  test(
    'Test with country code +63, number 0009876, should return 09876',
        () {
      final expected = '09876';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(countryCode: '+63', phoneInput: '0009876');
      expect(result, expected);
    },
  );
}
