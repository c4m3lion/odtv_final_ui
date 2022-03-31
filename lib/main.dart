import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:odtv_final_ui/screens/Main_page.dart';
import 'package:odtv_final_ui/screens/login_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        //LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        //LogicalKeySet(LogicalKeyboardKey.enter): ActivateIntent(),
      },
      child: FluentApp(
        title: 'OdTV',
        theme: ThemeData(
          accentColor: Colors.orange,
          focusTheme: FocusThemeData(
            borderRadius: BorderRadius.circular(5),
            glowFactor: 0.3,
            glowColor: Colors.green.withOpacity(0.1),
            primaryBorder: BorderSide(width: 2.0, color: Colors.green),
          ),
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        routes: {
          '/main': (context) => MainPage(),
          '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
