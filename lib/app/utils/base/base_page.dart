import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/utils/base/base_page_state.dart';

class BasePage extends StatefulWidget {
  final Widget Function(BuildContext context) pageBuilder;
  final VoidCallback? init;
  final VoidCallback? dispose;
  const BasePage({
    required this.pageBuilder,
    super.key,
    this.init,
    this.dispose,
  });

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends BasePageState<BasePage> {
  @override
  void initState() {
    super.initState();
    widget.init?.call();
  }

  @override
  void dispose() {
    widget.dispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.pageBuilder(context);
  }
}
