import 'package:flutter/material.dart';

class ChooseSelfBurgerItem extends StatelessWidget {
  final String id;
  const ChooseSelfBurgerItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(id);
  }
}
