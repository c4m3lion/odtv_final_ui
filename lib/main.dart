import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odtv_final_ui/screens/Main_page.dart';
import 'package:odtv_final_ui/screens/login_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
        //LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent(),
      },
      child: MaterialApp(
        title: 'ODTV',
        theme: ThemeData(
          primaryColor: Colors.orange,
          primarySwatch: Colors.cyan,
          brightness: Brightness.dark,
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //set border radius more than 50% of height and width to make circle
            ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/main': (context) => const MainPage(),
          '/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
