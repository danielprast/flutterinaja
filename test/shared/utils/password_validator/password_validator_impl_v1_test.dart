import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/model/warning_sign.dart';
import 'package:flutterinaja/apps/shared/utils/password_validator/password_validator.dart';

void main() {
  PasswordValidator makeSUT() {
    return PasswordValidatorImpl_V1();
  }

  test(
    'Test input asdlasdf, should returns 3 warning signs',
    () {
      final input = 'asdlasdf';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      expect(result.length, 3);
    },
  );

  test(
    'Test input asdlasdf, should return warning error messages',
    () {
      final input = 'asdlasdf';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final minCharWarning = result.first;
      expect(minCharWarning is MinCharWarning, true);
      expect(minCharWarning.isError, false);
    },
  );

  test(
    'Test input asdlasd, min char warning error should true',
    () {
      final input = 'asdlasd';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final minCharWarning = result.first;
      expect(minCharWarning is MinCharWarning, true);
      expect(minCharWarning.isError, true);
    },
  );

  test(
    'Test input asdlasdf, lowercase warning error should false',
    () {
      final input = 'asdlasdf';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final warning = result[1];
      expect(warning is LowerCaseLetterSign, true);
      expect(warning.isError, false);
    },
  );

  test(
    'Test input FFFFFFFF, lowercase warning error should true',
    () {
      final input = 'FFFFFFFF';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final warning = result[1];
      expect(warning is LowerCaseLetterSign, true);
      expect(warning.isError, true);
    },
  );

  test(
    'Test input asdfghjkG, uppercase warning error should false',
    () {
      final input = 'asdfghjkG';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final warning = result.last;
      expect(warning is UppercaseLetterSign, true);
      expect(warning.isError, false);
    },
  );

  test(
    'Test input asdfghjk, uppercase warning error should true',
    () {
      final input = 'asdfghjk';
      final sut = makeSUT();

      final result = sut.validatePassword(input);

      final warning = result.last;
      expect(warning is UppercaseLetterSign, true);
      expect(warning.isError, true);
    },
  );
}
