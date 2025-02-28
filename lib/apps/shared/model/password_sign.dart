part of 'warning_sign.dart';

class PasswordWarningSign extends WarningSign {
  //
  const PasswordWarningSign({
    required super.message,
    super.isError,
  });
}

class MinCharWarning extends PasswordWarningSign {
  //
  const MinCharWarning({
    required super.message,
    super.isError,
  });
}

class UppercaseLetterSign extends PasswordWarningSign {
  //
  const UppercaseLetterSign({
    required super.message,
    super.isError,
  });
}

class LowerCaseLetterSign extends PasswordWarningSign {
  //
  const LowerCaseLetterSign({
    required super.message,
    super.isError,
  });
}
