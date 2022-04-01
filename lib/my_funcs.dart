import 'package:fluent_ui/fluent_ui.dart';

class MyColors {
  static Color yellow = const Color(0xffFFC914);
  static Color black = const Color(0xff2E282A);
  static Color cyan = const Color(0xff17BEBB);
  static Color orange = const Color(0xffE4572E);
  static Color green = const Color(0xff76B041);
  static Color white = Colors.white;
}

class MyPrint {
  static void printWarning(String text) {
    print('\x1B[33m$text\x1B[0m');
  }

  static void printError(String text) {
    print('\x1B[31m$text\x1B[0m');
  }

  static void dialog(BuildContext context, String _title, String _content) {
    showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: Text(_title),
          content: Text(_content),
          actions: [
            Button(
              autofocus: true,
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
