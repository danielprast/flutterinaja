import 'package:flutter/material.dart';
import 'package:flutterinaja/apps/shared/route_stack_manager.dart';

class FormOverview extends StatefulWidget {
  const FormOverview({super.key});

  @override
  State<FormOverview> createState() => _FormOverviewState();
}

class _FormOverviewState extends State<FormOverview> implements FormOverviewRoute {
  //
  final RouteStackManager routeStackManager = RouteStackManager();

  @override
  void initState() {
    routeStackManager.push(RouteItem.newInstance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormOverviewFirst(route: this);
  }

  //region :: FormOverviewRoute
  @override
  void goingBack() {
    if (routeStackManager.count == 1) {
      finishFlow();
      return;
    }
    routeStackManager.pop();
    Navigator.of(context).pop();
  }

  @override
  void backToRoot() {
    routeStackManager.backToFirstRoute(
      onPoppedRoute: (_) {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void finishFlow() {
    routeStackManager.clearRoutes(
      onPoppedRoute: (_) {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void presentFormTwo() {
    routeStackManager.push(RouteItem.newInstance());
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FormOverviewSecond(route: this)),
    );
  }

  @override
  void presentFormThree() {
    routeStackManager.push(RouteItem.newInstance());
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FormOverviewThird(route: this)),
    );
  }

  @override
  void jumpToFormThreeFromRoot() {
    routeStackManager
      ..push(RouteItem.newInstance())
      ..push(RouteItem.newInstance());

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FormOverviewSecond(route: this)),
    );

    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FormOverviewThird(route: this)),
    );
  }
//endregion
}

//region :: Screen
class FormOverviewFirst extends StatelessWidget {
  //
  const FormOverviewFirst({
    super.key,
    this.route,
  });

  final FormOverviewRoute? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Expanded(child: Container()),
              const Text('Form Overview Section 1'),
              ElevatedButton(
                onPressed: () {
                  route?.presentFormTwo();
                },
                child: const Text('Next'),
              ),
              ElevatedButton(
                onPressed: () {
                  route?.finishFlow();
                },
                child: const Text('Dismiss'),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

class FormOverviewSecond extends StatelessWidget {
  //
  const FormOverviewSecond({
    super.key,
    this.route,
  });

  final FormOverviewRoute? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Expanded(child: Container()),
              const Text('Form Overview Section 2'),
              ElevatedButton(
                onPressed: () {
                  route?.presentFormThree();
                },
                child: const Text('Next'),
              ),
              ElevatedButton(
                onPressed: () {
                  route?.goingBack();
                },
                child: const Text('Back'),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

class FormOverviewThird extends StatelessWidget {
  //
  const FormOverviewThird({
    super.key,
    this.route,
  });

  final FormOverviewRoute? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Expanded(child: Container()),
              const Text('Form Overview Section 3'),
              ElevatedButton(
                onPressed: () {
                  route?.goingBack();
                },
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: () => route?.backToRoot(),
                child: const Text('Back to root'),
              ),
              ElevatedButton(
                onPressed: () {
                  route?.finishFlow();
                },
                child: const Text('Dismiss overview'),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
//endregion

//region :: Abstraction
abstract class BasicRoute {
  void goingBack();

  void finishFlow();

  void backToRoot();
}

abstract class FormOverviewRoute extends BasicRoute {
  void presentFormTwo();

  void presentFormThree();

  void jumpToFormThreeFromRoot();
}
//endregion
