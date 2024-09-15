import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:vizscope/pages/login_authentication.dart';
import 'package:vizscope/pages/home.dart';
import 'package:vizscope/pages/splash_screen.dart';

void main() async {
  Logger logger = Logger();

  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    logger.e(e.toString());
  }

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
      '/authentication': (context) => const LoginAuthentication(),
      '/home': (context) => const Home(),
    },
    debugShowCheckedModeBanner: false,
  ));
}