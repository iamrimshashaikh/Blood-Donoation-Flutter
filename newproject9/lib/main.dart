import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newproject9/authenticate/signin.dart';
import 'package:newproject9/firebase_options.dart';
import 'package:newproject9/screens/Admin/addmanager.dart';
import 'package:newproject9/screens/Admin/showmanagers.dart';
import 'package:newproject9/screens/SplashScreen.dart';
import 'package:newproject9/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/signin': (context) => SignUpView(),
        '/home': (context) => HomeScreen(),
        '/showmanagers': (context) => ShowManagersPage(),
        '/addmanagers': (context) => AddManagerPage(),
      },
    );
  }
}
