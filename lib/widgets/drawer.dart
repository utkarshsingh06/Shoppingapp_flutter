import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Mydrawer  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://wallpaperaccess.com/full/168293.jpg";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.zero,
                accountName: Text("Utkarsh Singh"),
                accountEmail: Text("us9766134gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,color: Colors.red,
            ),
            title: Text(
              "Title",textScaleFactor: 1.2,
              style: TextStyle(
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,color: Colors.red,
            ),
            title: Text(
              "Profile",textScaleFactor: 1.2,
              style: TextStyle(
                  color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,color: Colors.red,
            ),
            title: Text(
              "Mail us",textScaleFactor: 1.2,
              style: TextStyle(
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}