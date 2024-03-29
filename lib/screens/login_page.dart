import 'package:flutter/material.dart';
import 'package:odtv_final_ui/my_funcs.dart';
import 'package:odtv_final_ui/my_network.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userText = TextEditingController();
  final passText = TextEditingController();
  bool isLoading = false;
  String statusLogin = "";

  void validateInput(BuildContext context) async {
    if (isLoading) {
      return;
    }
    setState(() {
      statusLogin = "Looking for user...";
      isLoading = true;
    });
    String res =
        await MyNetwork().login(login: userText.text, pass: passText.text);
    if (res != "OK") {
      MyPrint.dialog(context, "Wrong credentials!",
          "Please enter right user informations!");
      setState(() {
        isLoading = false;
      });
      return;
    }
    setState(() {
      statusLogin = "Getting Channels...";
    });
    res = await MyNetwork().getChannels();
    if (res == "OK") {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      MyPrint.dialog(context, "Wrong credentials!",
          "Please enter right user informations!");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                        enabled: !isLoading,
                        decoration: const InputDecoration(
                          labelText: 'User',
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Provide an user';
                          }
                          return null;
                        },
                        controller: userText,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.number,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFormField(
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Provide an user';
                        }
                        return null;
                      },
                      controller: passText,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: isLoading
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const LinearProgressIndicator(),
                                Text(statusLogin)
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () {
                                isLoading ? null : validateInput(context);
                              },
                              child: const Text("Continue"),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
