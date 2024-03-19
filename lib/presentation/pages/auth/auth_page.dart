part of 'auth_page_mixin.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
    required this.onAuthChanged,
  });

  final VoidCallback onAuthChanged;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends BasePageState<AuthPage> with AuthPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _model,
      child: BasePage(
        pageBuilder: (context) {
          return Scaffold(
            body: _buildBody(context),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildTop(context),
        Expanded(
          child: _buildBodyContent(context),
        ),
      ],
    );
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      height: context.ext.screen.height * 0.15,
      decoration: BoxDecoration(
        color: context.colors.primary.color,
        borderRadius: context.ext.radius.borderRadiusOnlyBottomXL,
      ),
      child: Center(
        child: _buildTopLogo(context),
      ),
    );
  }

  Widget _buildTopLogo(BuildContext context) {
    return LayoutBuilder(
      builder: (_, cst) {
        final size = context.ext.screen.orientationSize(
          portrait: cst.maxWidth * 0.15,
          landscape: cst.maxHeight * 0.7,
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.logo,
              width: size,
              height: size,
            ),
            SizedBox(width: context.ext.values.sm),
            Text(
              'Burger Shop',
              style: context.ext.theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.colors.primary.onColor,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    final isSignIn = context.watch<AuthPageModel>().state.isSignIn;
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: context.ext.padding.horizontalXXL +
              context.ext.padding.verticalXXL,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _authTitle(context),
              SizedBox(height: context.ext.values.md),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _emailField(context),
                  SizedBox(height: context.ext.values.sm),
                  _passwordField(context),
                  if (!isSignIn) ...[
                    SizedBox(height: context.ext.values.sm),
                    _repasswordField(context),
                    SizedBox(height: context.ext.values.md),
                    _forgotPassword(context),
                  ],
                  SizedBox(height: context.ext.values.xxl),
                  _authButton(context),
                  SizedBox(height: context.ext.values.md),
                  _haveAccount(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authTitle(BuildContext context) {
    final isSignIn = context.watch<AuthPageModel>().state.isSignIn;
    return HeaderText(isSignIn ? 'Sign In' : 'Sign Up');
  }

  Widget _emailField(BuildContext context) {
    return CustomTextFormField(
      controller: _emailController,
      labelText: 'Email',
      hintText: 'Enter your email',
      validator: (value) {
        return AuthPageValidations.emailValidator(value);
      },
    );
  }

  Widget _passwordField(BuildContext context) {
    return PasswordTextFormField(
      controller: _passwordController,
      labelText: 'Password',
      hintText: 'Enter your password',
      validator: (value) {
        return AuthPageValidations.passwordValidator(value);
      },
    );
  }

  Widget _repasswordField(BuildContext context) {
    return PasswordTextFormField(
      controller: _repasswordController,
      labelText: 'Re-Password',
      hintText: 'Re-enter your password',
      validator: (value) {
        return AuthPageValidations.repasswordValidator(
          value,
          _passwordController.text,
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot password?',
        textAlign: TextAlign.right,
        style: context.ext.theme.textTheme.bodyLarge,
      ),
    );
  }

  Widget _authButton(BuildContext context) {
    final authModelState = context.watch<AuthPageModel>().state;
    return ElevatedButton(
      onPressed: authModelState.isBusy ? null : _onAuth,
      child: Text(authModelState.isSignIn ? 'Sign In' : 'Sign Up'),
    );
  }

  Widget _haveAccount(BuildContext context) {
    final authModelState = context.watch<AuthPageModel>().state;
    return GestureDetector(
      onTap: authModelState.isBusy ? null : _model.toggleAuthState,
      child: Text(
        authModelState.isSignIn
            ? 'Don\'t have an account? Sign Up'
            : 'Already have an account? Sign In',
        textAlign: TextAlign.center,
        style: context.ext.theme.textTheme.bodyLarge,
      ),
    );
  }
}
