import 'package:flutter/material.dart';
class ank extends StatefulWidget {
  const ank({Key? key}) : super(key: key);

  @override
  State<ank> createState() => _ankState();
}

class _ankState extends State<ank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Row(
      children: [
        IconButton(onPressed:(){
            },icon: Icon(Icons.add),),
       // SizedBox(width: 20,),;
        Container(height:10,width:10,child: Text('Ankita')),
           IconButton(onPressed:(){
          },icon: Icon(Icons.add),),

      ],
    ),

    );
  }
}
