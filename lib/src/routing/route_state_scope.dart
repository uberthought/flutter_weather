import 'package:flutter/material.dart';

import 'route_state.dart';

class RouteStateScope extends InheritedNotifier<RouteState> {
  const RouteStateScope({
    required RouteState notifier,
    required Widget child,
    Key? key,
  }) : super(key: key, notifier: notifier, child: child);

  static RouteState of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<RouteStateScope>()!.notifier!;
}
