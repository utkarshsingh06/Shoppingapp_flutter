import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/login_image.png",fit:BoxFit.fill,height: 400,
            ),
            Text("WELCOME",style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0 ),
              child: Column(
                children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
                  SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton(
                    child: Text("login"),
                    style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    onPressed: () {
                  Navigator.pushNamed(context, myroutes.homeroute);
                    },
                    ),
    ],
    ),
    ),
    ],
    ),
      ),
    );

  }
}
