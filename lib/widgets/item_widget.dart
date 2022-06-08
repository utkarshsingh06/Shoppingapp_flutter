import 'package:flutter/material.dart';
import 'package:myapp/models/catalogs.dart';
class ItemWidget extends StatelessWidget {
  final Item items;
  const ItemWidget({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          print("${items.name} pressed");
        },
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text("\$${items.price}",textScaleFactor:2.2,style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
      ));
  }
}


