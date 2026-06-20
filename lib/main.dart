import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SpaceNewsCoreApp());
}

class SpaceNewsCoreApp extends StatelessWidget {
  const SpaceNewsCoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceNews Core',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFEF4444),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEF4444)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
