import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
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
        await MyNetowrk().login(login: userText.text, pass: passText.text);
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
    res = await MyNetowrk().getChannels();
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
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    return SafeArea(
      child: ScaffoldPage(
        content: Center(
          child: SizedBox(
            width: 300,
            height: 260,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login"),
                  const SizedBox(
                    height: 15,
                  ),
                  InfoLabel(
                    label: 'User',
                    child: TextFormBox(
                      enabled: !isLoading,
                      placeholder: 'Your User',
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Provide an user';
                      },
                      controller: userText,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InfoLabel(
                    label: 'Password',
                    child: TextFormBox(
                      enabled: !isLoading,
                      placeholder: 'Your Password',
                      validator: (text) {
                        if (text == null || text.isEmpty)
                          return 'Provide an user';
                      },
                      controller: passText,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: isLoading
                            ? Column(
                                children: [ProgressBar(), Text(statusLogin)],
                              )
                            : FilledButton(
                                onPressed: () {
                                  isLoading ? null : validateInput(context);
                                },
                                child: Text("Continue"),
                              ),
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
