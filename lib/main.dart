  import 'package:firebase_core/firebase_core.dart';
  import 'package:flutter/material.dart';
  import 'package:mylastapp/pages/login_page.dart';
  import 'package:mylastapp/pages/signup_page.dart';
  import 'package:mylastapp/pages/splash_page.dart';
  import 'firebase_options.dart';
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(

      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp( const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    static Map<String, WidgetBuilder> routes = {
      'SignPage': (context) =>  SignUp(),
      'LoginPage': (context) =>   const Login(),
      'SplachPage': (context) =>   const splash(),
    };

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        routes: routes,
        debugShowCheckedModeBanner: false,
        initialRoute: 'SplachPage',
      );
    }
  }
