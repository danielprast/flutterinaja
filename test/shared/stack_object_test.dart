import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/data_structure/stack/stack.dart';

void main() {
  StackDart makeSut() {
    return DartStack();
  }

  test(
    'Storage should added 1',
    () {
      final stackSatu = StackItem.newInstance();
      final sut = makeSut();
      sut.push(stackSatu);
      expect(sut.count, 1);
    },
  );

  test(
    'Push an object then pop two times should return null',
    () {
      final stack1 = StackItem.newInstance();
      final sut = makeSut();
      sut.push(stack1);
      sut.pop();
      final lastPop = sut.pop();
      expect(lastPop, null);
    },
  );

  test(
    'Access the peak object when stack is empty, should return null',
    () {
      final sut = makeSut();
      expect(sut.peak == null, true);
    },
  );

  test(
    'Pushed three stack objects, access the peak object, should return latest pushed object',
    () {
      final sut = makeSut();

      sut
        ..push(StackItem.newInstance())
        ..push(StackItem.newInstance())
        ..push(StackItem.newInstance());

      expect(sut.peak != null, true);
    },
  );
}

// System Under Test
class DartStack extends StackDart {}
