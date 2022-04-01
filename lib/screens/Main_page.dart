import 'package:fluent_ui/fluent_ui.dart';
import 'package:odtv_final_ui/screens/mainpages/channles_page.dart';
import 'package:intl/intl.dart';
import 'package:odtv_final_ui/screens/mainpages/setting_page.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  String formattedDate = "";
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      formattedDate = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy \n hh:mm:ss').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationView(
        content: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: NavigationBody(
            index: _currentPage,
            transitionBuilder: (child, animation) =>
                EntrancePageTransition(child: child, animation: animation),
            children: const <Widget>[
              ChannelsPage(),
              FilesPage(),
              SettingPage(),
              ClockPage(),
            ],
          ),
        ),
        pane: NavigationPane(
          selected: _currentPage,
          onChanged: (i) => setState(() => _currentPage = i),
          header: Center(child: Text("ODTV")),
          displayMode: PaneDisplayMode.open,
          size: const NavigationPaneSize(openWidth: 120),
          items: <NavigationPaneItem>[
            PaneItem(
              autofocus: true,
              icon: SizedBox(),
              title: const Icon(
                FluentIcons.t_v_monitor,
                size: 50,
              ),
            ),
            PaneItem(
                icon: const Icon(
                  FluentIcons.app_icon_default,
                ),
                title: const Text("Files")),
            PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text("Settings")),
          ],
          footerItems: [
            PaneItem(icon: Text(formattedDate)),
          ],
        ),
      ),
    );
  }
}

class FilesPage extends StatelessWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Files"));
}

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("CLOCK"));
}
