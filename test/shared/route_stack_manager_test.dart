import 'package:flutter_test/flutter_test.dart';
import 'package:flutterinaja/apps/shared/route_stack_manager.dart';

void main() {

  RouteStackManager makeSut() {
    return RouteStackManager();
  }

  RouteItem makeRoute() {
    return RouteItem.newInstance();
  }

  test(
    'Test initial route, stack count should return 1',
    () {
      final sut = makeSut();

      sut.push(makeRoute());

      expect(sut.count, 1);
    },
  );

  test(
    'Test push 2 routes, stack count should return 2',
        () {
      final sut = makeSut();

      sut.push(makeRoute());
      sut.push(makeRoute());

      expect(sut.count, 2);
    },
  );

  test(
    'Test push 3 routes, then back to first route',
    () {
      final sut = makeSut();

      sut.push(makeRoute());
      sut.push(makeRoute());
      sut.push(makeRoute());

      sut.backToFirstRoute();

      expect(sut.count, 1);
    },
  );

  test(
    'Test push 4 routes, then clear existing routes',
        () {
      final sut = makeSut();

      sut
        ..push(makeRoute())
        ..push(makeRoute())
        ..push(makeRoute())
        ..push(makeRoute());

      sut.clearRoutes();

      expect(sut.count, 0);
    },
  );

  test(
    'Test perform back to first route when route stack count is 1, then stack count should remain 1.',
        () {
      final sut = makeSut()..push(makeRoute());

      sut.backToFirstRoute();

      expect(sut.count, 1);
    },
  );
}
