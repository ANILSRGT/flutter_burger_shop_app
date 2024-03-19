import 'package:flutter/material.dart';

class BusyWidget extends StatelessWidget {
  final bool busy;
  final Widget? busyChild;
  final Widget child;
  const BusyWidget({
    super.key,
    required this.busy,
    required this.child,
    this.busyChild,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? busyChild ?? const Center(child: CircularProgressIndicator())
        : child;
  }
}
