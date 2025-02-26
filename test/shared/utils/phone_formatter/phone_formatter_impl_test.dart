import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/utils/phone_formatter/phone_formatter.dart';

void main() {
  final expectedPhoneNumber = '0838344';

  PhoneNumberFormatter makeSUT() {
    return PhoneFormatterImpl();
  }

  test(
    'Test input phone validation +62838344, should replace that prefix to $expectedPhoneNumber.',
    () {
      final input = '+62838344';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(input);
      expect(result, expectedPhoneNumber);
    },
  );

  test(
    'Test input phone validation $expectedPhoneNumber, should replace that prefix to $expectedPhoneNumber.',
    () {
      final expected = expectedPhoneNumber;
      final sut = makeSUT();
      final result = sut.formatPhoneInput(expected);
      expect(result, expected);
    },
  );

  test(
    'Test input phone validation 000$expectedPhoneNumber, should replace that prefix to $expectedPhoneNumber.',
    () {
      final input = '000$expectedPhoneNumber';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(input);
      expect(result, expectedPhoneNumber);
    },
  );

  test(
    'Test input phone validation 838344, should replace that prefix to $expectedPhoneNumber.',
    () {
      final input = '838344';
      final sut = makeSUT();
      final result = sut.formatPhoneInput(input);
      expect(result, expectedPhoneNumber);
    },
  );
}
