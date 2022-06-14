import 'package:flutter/material.dart';
import 'package:myapp/utils/routes.dart';
import "package:velocity_x/velocity_x.dart";
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, myroutes.registerRoute);
      setState(() {
        changebutton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/undraw_hey_email_liaa.png", fit: BoxFit.fill,
                height: 400,
              ),
              Text("WELCOME $name", style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter username",
                        labelText: "Username",
                      ),
                      validator: (value) => value!.length< 1? "username cannot be empty" : null ,
                      onChanged: (value) {
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
                      validator:  (value) => value!.length< 6 ? "Password cannot be empty" : null ,
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius: BorderRadius.circular(8),
                      child: InkWell(
                        splashColor: Colors.red,
                        onTap: () => moveToHome(context),
                        child:AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 40,
                            width: changebutton ? 40 : 80,
                            alignment: Alignment.center,
                            child: changebutton ? Icon(
                                Icons.done,
                                color: Colors.white) : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}