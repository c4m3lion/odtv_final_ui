import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;
  String formattedDate = "";

  void changePaneItem(int _id) {
    _currentPage = _id;
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 100,
                ),
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => {},
                        title: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                                Image.asset("assets/images/channels-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/radio-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/app-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                                Image.asset("assets/images/settings-icon.png")),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formattedDate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: PageYesy())
            ],
          ),
        ),
      ),
    );
  }
}

class PageTest extends StatelessWidget {
  const PageTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.67),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(
            color: const Color(0xff4A4A4A).withOpacity(0.67),
          ),
        )
      ],
    );
  }
}

class PageYesy extends StatefulWidget {
  const PageYesy({Key? key}) : super(key: key);

  @override
  State<PageYesy> createState() => _PageYesyState();
}

class _PageYesyState extends State<PageYesy> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Item $index'),
            selected: index == _selectedIndex,
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
