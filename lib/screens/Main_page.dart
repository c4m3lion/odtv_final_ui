import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int _currentPage = 0;
  String formattedDate = "";
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
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
                      MaterialButton(
                        onPressed: () => {print("Hellos")},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child:
                                Image.asset("assets/images/channels-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {print("Hellos")},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/radio-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {print("Hellos")},
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Image.asset("assets/images/app-icon.png")),
                      ),
                      MaterialButton(
                        onPressed: () => {print("Hellos")},
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
          ),
        ),
      ),
    );
  }
}
