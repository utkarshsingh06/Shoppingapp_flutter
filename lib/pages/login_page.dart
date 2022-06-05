import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name="";
  bool changebu  = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/login_image.png",fit:BoxFit.fill,height: 400,
            ),
            Text("WELCOME $name",style: TextStyle(
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
                  onChanged: (value){
                    name = value;
                    setState(() {});
                  },
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
                  InkWell(
                    onTap: ()  async {
                      setState((){
                        changebu =true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, myroutes.homeroute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      height: 40,
                      width: changebu?40:80,
                      alignment: Alignment.center,
                      child: changebu?Icon(
                        Icons.done,
                        color: Colors.white ) : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                  )
                  /*ElevatedButton(
                    child: Text("login"),
                    style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                    onPressed: () {
                  Navigator.pushNamed(context, myroutes.homeroute);
                    },
                    ),*/
    ],
    ),
    ),
    ],
    ),
      ),
    );

  }
}
