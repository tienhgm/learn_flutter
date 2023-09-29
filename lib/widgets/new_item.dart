import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/categories.dart';
import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];
  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!));
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _enteredName,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text('Name'),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Name must be between 1 and 50 characters';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // if (newValue == null) return;
                    _enteredName = newValue!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        initialValue: _enteredQuantity.toString(),
                        decoration: const InputDecoration(
                          label: Text('Quantity'),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Must be a valid, positive number.';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          // if (newValue == null) return;
                          _enteredQuantity = int.parse(newValue!);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  key: ValueKey(category.value),
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        color: category.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(category.value.title)
                                    ],
                                  ))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _resetForm, child: const Text('Reset')),
                    ElevatedButton(
                        onPressed: _saveItem, child: const Text('Add'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
