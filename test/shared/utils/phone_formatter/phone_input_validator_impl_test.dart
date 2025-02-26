import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_formatter.dart';

void main() {
  PhoneInputValidator makeSUT() {
    return PhoneInputValidatorImpl();
  }

  test(
    'Test input +62 should return false',
    () {
      final input = '+62';
      final sut = makeSUT();
      final result = sut.validatePhoneInput(input);
      expect(result, false);
    },
  );

  test(
    'Test input 0 should return false',
        () {
      final input = '0';
      final sut = makeSUT();
      final result = sut.validatePhoneInput(input);
      expect(result, false);
    },
  );

  test(
    'Test input 62890 should return true',
    () {
      final input = '62890';
      final sut = makeSUT();
      final result = sut.validatePhoneInput(input);
      expect(result, true);
    },
  );
}
