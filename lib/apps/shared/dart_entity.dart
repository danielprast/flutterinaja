import 'package:equatable/equatable.dart';

class DartEntity extends Equatable {
  //
  const DartEntity({required this.id});

  final String id;

  @override
  List<Object?> get props => [id];
}