import 'package:flutter/material.dart';

import '../city.dart';
class rainy extends StatefulWidget {
  const rainy({Key? key}) : super(key: key);

  @override
  State<rainy> createState() => _rainyState();
}

class _rainyState extends State<rainy> {
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
          SizedBox(width:330,child: Text('Rain',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          SizedBox(width: 330,child: Text('23\u2103 ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
      Container(height: MediaQuery.of(context).size.height/2.5,
        width: MediaQuery.of(context).size.width/0.5,
          //SizedBox(height: 2,),

        decoration: BoxDecoration(image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/image/13290 rain.jpg'))),),
           SizedBox(height: 40,),
           Container(height: MediaQuery.of(context).size.height/3,
           width: MediaQuery.of(context).size.width/1.1,
             decoration:BoxDecoration(borderRadius:BorderRadius.circular(20),color:Colors.green.shade100, ),
             child:Column(
               children: [SizedBox(height: 10,),
                 Row(
                   children: [SizedBox(width:30 ,),
                     Image.asset('assets/image/rain (1).jpg',height: 40,width: 40,),
                    SizedBox(width: 10,),
                     SizedBox(width:75,child: Text('Today Heavy Rain')),
                     SizedBox(width: 90,),
                     Text('22\u2103/20\u2103')
                   ],
                 ),
                 SizedBox(height: 10,),
                 Row(
                   children: [SizedBox(width:30 ,),
                     Image.asset('assets/image/storm (3).png',height: 40,width: 40,),
                     SizedBox(width: 10,),
                    SizedBox(width:90,child: Text('Tomorrow Thunderstorm')),
                    SizedBox(width: 75,),
                     Text('22\u2103/19\u2103')
                   ],
                 ),
                 SizedBox(height: 10,),
                 Row(
                   children: [SizedBox(width:30 ,),
                     Image.asset('assets/image/windy.png',height: 40,width: 40,),
                     SizedBox(width: 10,),
                     SizedBox(width:90,child: Text('Saturday Cloudy Windy')),
                     SizedBox(width: 75,),
                     Text('24\u2103/20\u2103')
                   ],
                 ),
               ],
             ) ,)],),
    );
  }
}
