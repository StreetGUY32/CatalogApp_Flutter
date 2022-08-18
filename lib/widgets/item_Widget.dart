import 'package:first_app/models/catalog.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('Item ${item.name} was tapped.');
        },
        leading: Image.network(
          item.image,
          width: 100,
          height: 100,
        ),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text('\$${item.price.toString()}'),
      ),
    );
  }
}
