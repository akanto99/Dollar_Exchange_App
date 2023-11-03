import 'package:dollar_exchange_app/firebase_options.dart';
import 'package:dollar_exchange_app/widgets/after_animCon_widgets.dart';
import 'package:dollar_exchange_app/widgets/all_countries_widgets.dart';
import 'package:dollar_exchange_app/widgets/animated_container_widgets.dart';
import 'package:dollar_exchange_app/screens/home_screens.dart';
import 'package:dollar_exchange_app/widgets/frequently_askques_widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueGrey.shade900,
      statusBarColor: Colors.blueGrey.shade900
  ));
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home:HomeScreen()
    );
  }
}
