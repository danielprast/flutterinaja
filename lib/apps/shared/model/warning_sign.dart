import 'package:equatable/equatable.dart';

part 'password_sign.dart';

class WarningSign extends Equatable {
  //
  const WarningSign({
    required this.message,
    this.isError = true,
  });

  final String message;
  final bool isError;

  WarningSign copyWith({
    String? message,
    bool? isError,
  }) {
    return WarningSign(
      message: message ?? this.message,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [message, isError];
}
