// ignore_for_file: library_prefixes

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/request/http_main.dart';
import 'package:flutter_getx/theme/app_theme.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_getx/router/router_config.dart' as R;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with HttpMain {
  MyApp({super.key}) {
    register(Env.test);
  }
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      builder: BotToastInit(), //1.调用BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
      themeMode: ThemeMode.dark,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: R.RouterConfig.Home,
      getPages: R.RouterConfig.getRouters(),
    );
  }
}
