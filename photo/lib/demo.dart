import 'package:flutter/material.dart';
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Choose an option',
              ),
              value: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Please choose an option';
                }
                return null;
              },
              items: [
                DropdownMenuItem(
                  value: 'option1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 'option2',
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 'option3',
                  child: Text('Option 3'),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
