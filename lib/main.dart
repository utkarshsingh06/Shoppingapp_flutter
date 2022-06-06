import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.pink),
      darkTheme: ThemeData(
    brightness: Brightness.light,
    ),
      initialRoute: "/home",
      routes: {
        myroutes.homeroute :(context) => Homepage(),
        myroutes.loginroute :(context) => Login(),
      },
    );
  }
}
