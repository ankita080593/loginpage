import 'package:flutter/material.dart';
class click extends StatefulWidget {
  const click({Key? key}) : super(key: key);

  @override
  State<click> createState() => _clickState();
}

class _clickState extends State<click> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(children: [
      Icon(Icons.close),

    ],),
    );
  }
}
