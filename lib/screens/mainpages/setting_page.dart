import 'package:fluent_ui/fluent_ui.dart';
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
      color: Color(0xff4A4A4A).withOpacity(0.70),
      child: Scrollbar(
        //controller: _controller,
        child: ListView(
          /// You can add a padding to the view to avoid having the scrollbar over the UI elements
          padding: EdgeInsets.only(right: 16.0),
          children: [
            TappableListTile(
              onTap: () => {},
              leading: Icon(
                FluentIcons.user_optional,
                size: 30,
              ),
              title: Text('User'),
              subtitle: Text(MyNetowrk.userLogin),
              isThreeLine: true,
            ),
            TappableListTile(
              onTap: () => {},
              leading: Icon(
                FluentIcons.power_apps,
                size: 30,
              ),
              title: Text('Version'),
              subtitle: Text('v0.0.1'),
              isThreeLine: true,
            ),
            TappableListTile(
              onTap: () => {},
              leading: Icon(
                FluentIcons.locale_language,
                size: 30,
              ),
              title: Text('Languages'),
              subtitle: Text('Change app language'),
              isThreeLine: true,
            ),
            TappableListTile(
              onTap: () => {Navigator.pushReplacementNamed(context, '/login')},
              leading: Icon(
                FluentIcons.sign_out,
                size: 30,
              ),
              title: Text('Log out'),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }
}
