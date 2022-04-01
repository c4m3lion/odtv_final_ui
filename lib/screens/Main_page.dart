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
              Expanded(
                flex: 1,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 3,
                child: Container(color: Colors.black.withOpacity(0.7)),
              ),
              Expanded(
                flex: 5,
                child: Container(color: Colors.grey.withOpacity(0.7)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
