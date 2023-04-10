// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter_getx/page/home/home_page.dart';
import 'package:get/route_manager.dart';

class RouterConfig {

  static const Home = "/"; 

  static List<GetPage> getRouters() {
    List<GetPage> list = [
      GetPage(name: Home, page: () => HomePage())
    ];
    return list;
  }
}
