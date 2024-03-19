part of 'home_page_mixin.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pageBuilder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: context.ext.padding.allXL,
              child: Column(
                children: [
                  const HeaderText('Burger Shop'),
                  Container(
                    height: 125,
                    color: Colors.red,
                  ),
                  Container(
                    height: 125,
                    color: Colors.amber,
                  ),
                  Container(
                    height: 125,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 125,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
