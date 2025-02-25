part of 'stack_impl.dart';

class StackItem extends DartEntity {
  //
  const StackItem({required super.id});

  factory StackItem.newInstance() {
    return StackItem(id: Uuid().v1());
  }
}