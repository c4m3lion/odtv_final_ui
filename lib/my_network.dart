import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:odtv_final_ui/my_funcs.dart';

class MyNetowrk {
  ///////User Infos\\\\\\\\\\\\\\\\
  static String token = "";
  static String userLogin = "";
  static String userPass = "";
  //////chanels
  static Channel currentChanel = Channel();
  static List<Channel> channels = List.empty(growable: true);
  static List<Category> categorys = List.empty(growable: true);

  Future<String> login({required String login, required String pass}) async {
    try {
      String macAdress = "02:00:00:00:00:00";
      Response response = await post(
        Uri.parse("https://mw.odtv.az/api/v1/auth"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            "login": login,
            "password": pass,
            "mac": macAdress,
          },
        ),
      );
      userLogin = login;
      userPass = pass;
      MyPrint.printWarning(response.body);
      Map data = jsonDecode(response.body);
      if (data.containsKey("error")) {
        return data['error']['message'];
      } else {
        token = data['sid'];
        return "OK";
      }
    } catch (e) {
      MyPrint.printError(e.toString());
      return e.toString();
    }
  }

  Future<String> getChannels() async {
    try {
      Response response = await get(
        Uri.parse("https://mw.odtv.az/api/v1/channels"),
        headers: {
          'oms-client': token,
        },
      );
      MyPrint.printWarning(response.body);
      Map data = jsonDecode(response.body);
      if (data.containsKey("error")) {
        return data['error']['message'];
      } else {
        categorys.clear();
        channels.clear();
        Category c1 = Category();
        c1.id = "channel";
        c1.position = -1;
        c1.name = "Channels";
        categorys.add(c1);
        c1 = Category();
        c1.id = "favorites";
        c1.position = -2;
        c1.name = "Favorites";
        categorys.add(c1);
        for (var i in data['categories']) {
          Category c = Category();
          c.id = i['id'];
          c.position = i['position'];
          c.name = i['name'];
          categorys.add(c);
        }
        for (var i in data['channels']) {
          Channel c = Channel();
          c.id = i['id'];
          c.lcn = i['lcn'];
          c.position = i['position'];
          c.name = i['name'];
          c.category = i['category'];
          c.archive = i['archive'];
          c.icon = i['icon'];
          channels.add(c);
        }
        currentChanel = channels[0];
        return "OK";
      }
    } catch (e) {
      MyPrint.printError(e.toString());
      return e.toString();
    }
  }
}

class Channel {
  String id = "";
  int lcn = 1;
  int position = 1;
  String name = "";
  String category = "";
  bool archive = false;
  String icon = "";
  String playBackUrl = "";
  bool isFavorite = false;
}

class Category {
  String id = "";
  String name = "";
  int position = 0;
}

class EPG {
  String id = "";
  String title = "";
  int start = 0;
  int end = 0;
  String description = "";
  String startdt = "";
  String enddt = "";
}

class MyLocalData {
  final storage = const FlutterSecureStorage();
  static int selectedChannelPage = 0;

  void initData() async {
    MyNetowrk.userLogin = (await storage.read(key: "userLogin")) ?? "";
    MyNetowrk.userPass = (await storage.read(key: "userPass")) ?? "";
  }

  Future<void> setData() async {
    await storage.write(key: "userLogin", value: MyNetowrk.userLogin);
    await storage.write(key: "userPass", value: MyNetowrk.userPass);
  }

  void deleteDatas() async {
    await storage.deleteAll();
  }
}
