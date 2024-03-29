import 'package:flutter/material.dart';
import 'package:odtv_final_ui/my_network.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff4A4A4A).withOpacity(0.70),
      child: Scrollbar(
        //controller: _controller,
        child: ListView(
          /// You can add a padding to the view to avoid having the scrollbar over the UI elements
          padding: const EdgeInsets.only(right: 16.0),
          children: [
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () => {},
                leading: const Icon(
                  Icons.verified_user,
                  size: 30,
                ),
                title: const Text('User'),
                subtitle: Text(MyNetwork.userLogin),
                isThreeLine: true,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () => {},
                leading: const Icon(
                  Icons.app_registration,
                  size: 30,
                ),
                title: const Text('Version'),
                subtitle: const Text('v0.0.1'),
                isThreeLine: true,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () => {},
                leading: const Icon(
                  Icons.language,
                  size: 30,
                ),
                title: const Text('Languages'),
                subtitle: const Text('Change app language'),
                isThreeLine: true,
              ),
            ),
            Material(
              color: Colors.transparent,
              child: ListTile(
                onTap: () =>
                    {Navigator.pushReplacementNamed(context, '/login')},
                leading: const Icon(
                  Icons.logout,
                  size: 30,
                ),
                title: const Text('Log out'),
                subtitle: const Text(""),
                isThreeLine: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
