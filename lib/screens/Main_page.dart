import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:odtv_final_ui/screens/channles_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationView(
      content: NavigationBody(
        index: _currentPage,
        transitionBuilder: (child, animation) =>
            EntrancePageTransition(child: child, animation: animation),
        children: const <Widget>[ChannelsPage(), FilesPage(), SettingsPage()],
      ),
      pane: NavigationPane(
          selected: _currentPage,
          onChanged: (i) => setState(() => _currentPage = i),
          displayMode: PaneDisplayMode.auto,
          size: const NavigationPaneSize(openWidth: 120),
          items: <NavigationPaneItem>[
            PaneItem(
              autofocus: true,
              icon: const Icon(FluentIcons.t_v_monitor),
              title: const Text("Channels"),
            ),
            PaneItem(
                icon: const Icon(
                  Icons.apps,
                ),
                title: const Text("Files")),
            PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text("Settings")),
          ]),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Home"));
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
