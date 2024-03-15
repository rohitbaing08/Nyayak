import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nyayak/firebase_options.dart';
import 'package:nyayak/res/routes_constant.dart';
import 'package:nyayak/res/theme/theme_constants.dart';
import 'package:nyayak/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => HomeViewModel()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
