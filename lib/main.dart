import 'package:flutter/material.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/login_page.dart';
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
      initialRoute: "/login",
      routes: {
        "/": (context) =>  Homepage(),
        "/login":(context) => Login(),
      },
    );
  }
}
