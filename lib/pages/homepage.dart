import "package:flutter/material.dart";
import 'package:myapp/widgets/drawer.dart';
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int da=30;
    final String name ="boss";
    return Scaffold(
      appBar: AppBar(
        title: Text("Meta data"),
      ),
      body: Center(
        child: Container(
          child: Text("this is $da app by $name"),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
