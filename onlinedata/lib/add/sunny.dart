import 'package:flutter/material.dart';

import '../city.dart';
class sunny extends StatefulWidget {
  const sunny({Key? key}) : super(key: key);

  @override
  State<sunny> createState() => _sunnyState();
}

class _sunnyState extends State<sunny> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white,body:
    Column(
      children: [SizedBox(height: 30,),
        Align(alignment: Alignment.topCenter,
          child: Row(
            children: [SizedBox(width: 20,),
              IconButton(onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>city()));
              },icon:Icon(Icons.add,size: 35,)),
              SizedBox(width: 110,),
              Text('Surat',style: TextStyle(fontSize: 20),),
              SizedBox(width:110 ,),
              PopupMenuButton(icon:Icon(Icons.more_vert),itemBuilder:(context)=>[PopupMenuItem(child:Text('share')),
                PopupMenuItem(child:Text('settings')),])
            ],
          ),
        ),
        SizedBox(width:330,child: Text('Clear',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        SizedBox(width: 330,child: Text('34\u2103 ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
        Container(height: MediaQuery.of(context).size.height/2.2,
          width: MediaQuery.of(context).size.width/1.1,
          //SizedBox(height: 2,),

          decoration: BoxDecoration(image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/image/summerImage.jpeg'))),),
        SizedBox(height: 15,),
        Container(height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width/1.1,
          decoration:BoxDecoration(borderRadius:BorderRadius.circular(20),color:Colors.green.shade100, ),
          child:Column(
            children: [SizedBox(height: 10,),
              Row(
                children: [SizedBox(width:30 ,),
                  Image.asset('assets/image/sun.png',height: 40,width: 40,),
                  SizedBox(width: 10,),
                  SizedBox(width:75,child: Text('Today Sunny')),
                  SizedBox(width: 90,),
                  Text('34\u2103/28\u2103')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [SizedBox(width:30 ,),
                  Image.asset('assets/image/cloudy (3).png',height: 40,width: 40,),
                  SizedBox(width: 10,),
                  SizedBox(width:90,child: Text('Tomorrow Mostly Sunny')),
                  SizedBox(width: 75,),
                  Text('31\u2103/24\u2103')
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [SizedBox(width:30 ,),
                  Image.asset('assets/image/cloudy.png',height: 40,width: 40,),
                  SizedBox(width: 10,),
                  SizedBox(width:90,child: Text('Saturday Cloudy')),
                  SizedBox(width: 75,),
                  Text('29\u2103/24\u2103')
                ],
              ),
            ],
          ) ,)],),
    );
  }
}
