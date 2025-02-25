import 'package:equatable/equatable.dart';
import 'package:flutterinaja/apps/shared/dart_entity.dart';
import 'package:uuid/uuid.dart';

part 'stack_item.dart';

class StackDart<T extends Equatable> {
  //
  final List<T> _storage = [];

  List<T> get storage => _storage;

  int get count => _storage.length;

  T? get peak => count == 0 ? null : _storage.last;

  void push(T item) {
    _storage.add(item);
  }

  T? pop() {
    if (peak == null) {
      return null;
    }
    return _storage.removeLast();
  }
}
