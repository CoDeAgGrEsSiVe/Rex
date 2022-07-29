import 'package:flutter/material.dart';
import 'package:rex/view/screens/auth/login/login.dart';
import 'package:rex/view/screens/onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preference = await SharedPreferences.getInstance();
  initScreen = preference.getInt('initScreen');
  await preference.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? 'onboard' : 'onboard',
      routes: {
        'onboard': (context) => const Onbording(),
        'home': (context) => const LoginScreen(),
      },
    );
  }
}
