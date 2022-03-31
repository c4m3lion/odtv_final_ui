import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String btn = "";
  String btn2 = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ContentDialog(
          title: Center(child: Text('Login')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextBox(
                autofocus: true,
                placeholder: "User",
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  //checkInput();
                },
                textInputAction: TextInputAction.next,
              ),
              TextBox(
                autofocus: true,
                placeholder: "Password",
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
          actions: [
            Button(
              child: Text('Ok'),
              onPressed: () {
                //Navigator.pushReplacementNamed(context, '/main');
                btn2 = "Duyme Basildi AYE";
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
