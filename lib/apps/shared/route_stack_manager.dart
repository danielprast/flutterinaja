import 'package:flutterinaja/apps/shared/data_structure/stack/stack.dart';
import 'package:uuid/uuid.dart';

final class RouteStackManager<RouteItem> extends StackDart {

  void backToFirstRoute({Function(RouteItem?)? onPoppedRoute}) {
    while (count > 1) {
      final route = pop();
      onPoppedRoute?.call(route as RouteItem);
    }
  }

  void clearRoutes({Function(RouteItem?)? onPoppedRoute}) {
    while (count > 0) {
      final route = pop();
      onPoppedRoute?.call(route as RouteItem);
    }
  }
}

class RouteItem extends StackItem {
  //
  const RouteItem({required super.id});

  factory RouteItem.newInstance() {
    return RouteItem(id: Uuid().v1());
  }
}
