part of 'splash_page_mixin.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPage> with SplashPageMixin {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      pageBuilder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  ImageConstants.logo,
                  height: context.ext.screen.orientationSquareSize * 0.35,
                  width: context.ext.screen.orientationSquareSize * 0.35,
                ),
                const Spacer(),
                const CircularProgressIndicator(),
                SizedBox(height: context.ext.screen.height * 0.1),
              ],
            ),
          ),
        );
      },
    );
  }
}
