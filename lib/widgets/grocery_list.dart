import 'package:flutter/material.dart';
import 'package:flutter_app/data/dummy_items.dart';

class GloceryList extends StatelessWidget {
  const GloceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(groceryItems[index].name),
                leading: Container(
                  height: 24,
                  width: 24,
                  color: groceryItems[index].category.color,
                ),
                trailing: Text(groceryItems[index].quantity.toString()),
              )),
    );
  }
}
