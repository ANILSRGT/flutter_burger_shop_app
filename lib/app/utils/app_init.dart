import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burger_shop_app/firebase_options.dart';

final class AppInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initServices();
  }

  static Future<void> _initServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
