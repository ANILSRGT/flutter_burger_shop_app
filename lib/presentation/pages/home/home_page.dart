part of 'home_page_mixin.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> with HomePageMixin {
  final List<List<String>> _selfBurgerItems = [
    [
      DummyImageConstants.burgerBunTop,
      DummyImageConstants.charcoalBurgerBunTop,
    ],
    [
      DummyImageConstants.cheddar,
      DummyImageConstants.beef,
    ],
    [
      DummyImageConstants.burgerBunBottom,
      DummyImageConstants.charcoalBurgerBunBottom,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      pageBuilder: (context) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(context),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Burger Shop'),
      centerTitle: true,
      actions: [
        _buildShoppingCartBtn(),
      ],
    );
  }

  Stack _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBodyContent(context),
        Positioned(
          bottom: context.ext.values.md,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: SizedBox(
                width: context.ext.screen.width * 0.8,
                height: context.ext.values.xxxl,
                child: _orderNowButton(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  SingleChildScrollView _buildBodyContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.ext.padding.allL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _chooseBurgerTitle(),
                _newItemButton(context),
              ],
            ),
            SizedBox(height: context.ext.values.md),
            _buildSelfBurgerItems(_selfBurgerItems),
            SizedBox(height: context.ext.values.md + context.ext.values.xxxl),
          ],
        ),
      ),
    );
  }

  IconButton _buildShoppingCartBtn() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.shopping_bag_rounded),
    );
  }

  TitleText _chooseBurgerTitle() => const TitleText('Choose your burger');

  IconButton _newItemButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add_circle_outline_rounded),
      color: context.colors().primary.color,
      iconSize: 32,
    );
  }

  ListView _buildSelfBurgerItems(List<List<String>> items) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: context.ext.values.md);
      },
      itemBuilder: (BuildContext context, int index) {
        return ChooseSelfBurger(
          items: items[index],
          itemId: DummyImageConstants.burgerBunTop,
          onChoose: (itemId) {},
        );
      },
    );
  }

  ElevatedButton _orderNowButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Order Now'),
    );
  }
}
