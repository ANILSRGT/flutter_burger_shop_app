enum AppRouteKeys {
  notFound(path: '/not-found'),
  splash(path: '/'),
  home(path: '/home'),
  auth(path: '/auth');

  const AppRouteKeys({
    required this.path,
  });

  final String path;
}
