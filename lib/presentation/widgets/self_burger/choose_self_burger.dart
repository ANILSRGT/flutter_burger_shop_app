import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/app/utils/extensions/context_extensions.dart';
import 'package:flutter_burger_shop_app/presentation/widgets/self_burger/choose_self_burger_item.dart';

class ChooseSelfBurger extends StatefulWidget {
  const ChooseSelfBurger({
    super.key,
    required this.items,
    required this.itemId,
    required this.onChoose,
  });

  /// [items] is list of item id
  final List<String> items;

  /// [itemId] is first selected item id
  final String itemId;

  /// [onChoose] is callback function when item is selected
  final void Function(String itemId) onChoose;

  @override
  State<ChooseSelfBurger> createState() => _ChooseSelfBurgerState();
}

class _ChooseSelfBurgerState extends State<ChooseSelfBurger>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: context.ext.screen.height * 0.1,
        constraints: const BoxConstraints(
          minHeight: 60,
          maxHeight: 100,
          minWidth: 50,
          maxWidth: 350,
        ),
        decoration: BoxDecoration(
          color: context.colors().background.color,
          borderRadius: context.ext.radius.borderRadiusXL,
          boxShadow: [
            BoxShadow(
              color: context.colors().primary.color.withOpacity(0.5),
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: PageView.builder(
          controller: _pageController,
          pageSnapping: true,
          itemCount: widget.items.length,
          onPageChanged: (index) {
            widget.onChoose(widget.items[index]);
            _selectedIndex = index;
          },
          itemBuilder: (BuildContext context, int index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (context, child) {
                double value = 1;
                if (_pageController.position.haveDimensions) {
                  value = _pageController.page! - index;
                  value = (1 - (value.abs() * 0.5)).clamp(0.1, 1.0);
                } else {
                  value = index == _selectedIndex ? 1.0 : 0.5;
                }
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Padding(
                padding: context.ext.padding.allM,
                child: ChooseSelfBurgerItem(
                  id: widget.items[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
