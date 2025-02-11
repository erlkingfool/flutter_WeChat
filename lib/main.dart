import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/currentIndex.dart';
import './provide/websocket.dart';
import './common/style/style.dart' show AppColors;
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';

void main() {
  var providers = Providers();
  var currentIndexProvide = CurrentIndexProvide();
  var websocketProvide = WebSocketProvide();
  providers
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))//监控页面index
    ..provide(Provider<WebSocketProvide>.value(websocketProvide));//监控websocket
  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routers.configureRouters(router);
    Application.router = router;
    Provide.value<WebSocketProvide>(context).init(); //!初始化
    return Container(
        child: MaterialApp(
      title: 'HM',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(AppColors.PrimaryColor),
        cardColor: Color(AppColors.CardBgColor),
        backgroundColor: Color(AppColors.BackgroundColor),
      ),
      home: IndexPage(),
    ));
  }
}
