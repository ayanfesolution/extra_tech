

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RouteScreen extends StatefulHookConsumerWidget {
  const RouteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RouteScreenState();
}
class _RouteScreenState extends ConsumerState<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [],),
    );
  }
}