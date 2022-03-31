import 'package:fluent_ui/fluent_ui.dart';
import 'package:odtv_final_ui/screens/mainpages/channles_page.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return SafeArea(
      child: NavigationView(
        content: NavigationBody(
          index: _currentPage,
          transitionBuilder: (child, animation) =>
              EntrancePageTransition(child: child, animation: animation),
          children: const <Widget>[
            ChannelsPage(),
            FilesPage(),
            SettingsPage(),
            //ClockPage(),
          ],
        ),
        pane: NavigationPane(
          selected: _currentPage,
          onChanged: (i) => setState(() => _currentPage = i),
          header: Container(child: Text("ODTV")),
          displayMode: PaneDisplayMode.compact,
          size: const NavigationPaneSize(openWidth: 120),
          items: <NavigationPaneItem>[
            PaneItem(
              autofocus: true,
              icon: const Icon(FluentIcons.t_v_monitor),
              title: const Text("Channels"),
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
          // footerItems: [
          //   PaneItem(
          //     icon: Container(
          //       color: Colors.blue,
          //       width: 30,
          //     ),
          //   ),
          // ],
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

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Settings"));
}

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("CLOCK"));
}
