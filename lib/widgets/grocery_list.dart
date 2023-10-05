import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/categories.dart';
import 'package:flutter_app/data/dummy_items.dart';
// import 'package:flutter_app/data/dummy_items.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:flutter_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryState();
}

class _GroceryState extends State<GroceryList> {
  late List<GroceryItem> _groceryItems = [];
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https('flutter-learn-963e5-default-rtdb.firebaseio.com',
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> _loadItems = [];
    for (final item in listData.entries) {
      print(item.value);
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.title == item.value['category'])
          .value;
      _loadItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    setState(() {
      _groceryItems = _loadItems;
    });
  }

  void _addItem(BuildContext context) async {
    await Navigator.of(context).push<GroceryItem>(
        MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet!.'),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _groceryItems.isNotEmpty
          ? ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (context, index) => Dismissible(
                    onDismissed: (direction) {
                      _removeItem(groceryItems[index]);
                    },
                    key: ValueKey(_groceryItems[index].id),
                    child: ListTile(
                      title: Text(_groceryItems[index].name),
                      leading: Container(
                        height: 24,
                        width: 24,
                        color: _groceryItems[index].category.color,
                      ),
                      trailing: Text(_groceryItems[index].quantity.toString()),
                    ),
                  ))
          : content,
    );
  }
}
