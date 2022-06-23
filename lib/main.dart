import 'package:flutter/material.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/pages/register.dart';
import 'package:myapp/store/store.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
void main()
{
  runApp(VxState(store: MyStore(),
  child: Myapp()));
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        myroutes.homeroute :(context) => Homepage(),
        myroutes.loginroute :(context) => Login(),
        myroutes.CartRoute :(context) => CartPage(),
        myroutes.registerRoute :(context) => MyRegister(),
      },
    );
  }
}