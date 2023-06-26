import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onlinedata/clear.dart';
import 'package:onlinedata/add/sunny.dart';
import 'package:onlinedata/add/snow.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'add/rainy.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var mydata;
  var mydata1;
  var id, base, main, description, icon, temp;
  bool show = true;

  /*Future<void> getData() async {
    var key = '21c34ac001e96decdb94d218f7fcabc9';
    var lat = '21.2216';
    var long = '72.7887';
    var dist = 'surat';
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=$dist&appid=21c34ac001e96decdb94d218f7fcabc9'));

    if (response.statusCode == 200) {
      var mydata = await jsonDecode(response.body);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => clear(mydata: mydata)));
    }
    else {
      print('something went wrong');
    }
  }*/

  late LocationData _currentPosition;
  var lat;
  var long;

  Future<void> getDatalatlong() async {
    if (await Permission.location.isGranted) {
      _currentPosition = await Location().getLocation();
      print(_currentPosition);

      setState(() {
        lat=_currentPosition.latitude.toString();
        long=_currentPosition.longitude.toString();
      });
      String url="https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=21c34ac001e96decdb94d218f7fcabc9";
      var key = '21c34ac001e96decdb94d218f7fcabc9';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var mydata = await jsonDecode(response.body);
        print(response.body);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => clear(mydata: mydata,)));
      }
      else {
        print('something went wrong');
      }
    } else {
      Permission.location.request();
    }
  }


// Future<void> getLocation() async {
//   if (await Permission.location.isGranted) {
//     _currentPosition = await Location().getLocation();
//     print("Location");
//     print(_currentPosition.latitude);
//     print(_currentPosition.longitude);
//   } else {
//     Permission.location.request();
//   }
// }

  TextEditingController city = TextEditingController();
  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // getLocation();
    //getData();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/image/Untitled design.jpg'),
              )
          ),

          child: Column(
            children: [SizedBox(height: 300,),
              Text('Weather', style: TextStyle(color: Colors.blueGrey,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),),
              Text('Forecasts', style: TextStyle(color: Colors.blueGrey,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Colors.deepOrangeAccent), onPressed: () {
                // if(_formKey.currentState!.validate()){
                // getData();
                getDatalatlong();
              }, child: Text('Get Started'))
            ],
          ),

          /* child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children:[ SizedBox(height: 250,),Row(
          children: [
            Container(height: 40,width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter City',
                prefixIcon: IconButton(onPressed: (){

                },
                icon: Icon(Icons.search),)),
                controller: city,
                validator: (values){
                  if (values == null || values.isEmpty){
                    return 'city is required';
                  }
                return null;
                },
              ),
            ),
          ],
        ),
          ],
      ),*/
        ),
        /*child: Center(
            child: Container(height:600,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [SizedBox(height: 30,),
                      TextFormField(style: TextStyle(color: Colors.white),cursorColor: Colors.white,
                          decoration: InputDecoration(hintText: 'Enter latitude',border: OutlineInputBorder(),),
                          controller: latitude,
                          validator: (values) {
                            if (values == null || values.isEmpty) {
                              return 'latitude is required';
                            } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[.]).{7,}$')
                                .hasMatch(values)) {
                              return 'latitude is not valid';
                            }
                            return null;
                          }),
                      SizedBox(height: 10,),
                      TextFormField(style: TextStyle(color: Colors.white),cursorColor: Colors.white,
                          decoration: InputDecoration(hintText: 'Enter longitude',border: OutlineInputBorder(),),
                          controller: longitude,
                          validator: (values) {
                            if (values == null || values.isEmpty) {
                              return 'longitude is required';
                            } else if (!RegExp(r'^(?=.*?[0-9])(?=.*?[.]).{7,}$')
                                .hasMatch(values)) {
                              return 'longitude is not valid';
                            }
                            return null;
                          }),
                      // TextFormField(
                      //   decoration: InputDecoration(hintText: 'Enter city name'),
                      //   controller: city,
                      //   validator: (values){
                      //     if(values==null||values.isEmpty){
                      //       return 'city name is required';
                      //     }else if(!RegExp(r'^(?=.*?[a-z])$').hasMatch(values)){
                      //       return 'city name is not valid';
                      //     }
                      //     return null;
                      //   }
                      // ),

                  ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                    getData();
                                   setState(() {
                                     show=false;
                                   });
                                }else{
                                  setState(() {
                                    show=true;
                                  });
                                }
                              },
                              child: Text('Serch'),),
                          Visibility(visible: show,
                            replacement: Column(children:[SizedBox(height: 50,),
                              Text(mydata!=null?mydata['weather'][0]['main'].toString():'',style: TextStyle(color: Colors.white),),
                              Text(mydata!=null?mydata['weather'][0]['description'].toString():'',style: TextStyle(color: Colors.white),),
                              SizedBox(height:130,child: Icon(Icons.cloudy_snowing,size: 60,color: Colors.white,)),
                              Text(mydata!=null?mydata['main']["temp"].toString():'',style: TextStyle(fontSize: 50,color: Colors.white),),
                              Text(mydata!=null?mydata['base']:'',style: TextStyle(color: Colors.white),),
                              Text(mydata!=null?mydata['visibility'].toString():'',style: TextStyle(color: Colors.white),),
                              Row(
                                children: [SizedBox(width: 140,height: 90,),
                                  Column(
                                    children: [
                                      Text('min',style: TextStyle(color: Colors.white),),
                                      Text(mydata!=null?mydata['main']["temp_min"].toString():'',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                  Text('|',style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Column(
                                    children: [
                                      Text('max',style: TextStyle(color: Colors.white),),
                                      Text(mydata!=null?mydata['main']["temp_max"].toString():'',style: TextStyle(color: Colors.white),)
                                    ],
                                  ),

                                ],
                              )
                            ],),
                            child:Column(children:[Text('MAIN',style: TextStyle(color: Colors.white),),
                              Text('DESCRIPTION',style: TextStyle(color: Colors.white)),
                      SizedBox(height:130,child: Icon(Icons.cloudy_snowing,size: 60,color: Colors.white,)),
                              Text('TEMPERATURE',style: TextStyle(color: Colors.white),),
                              Text('BASE',style: TextStyle(color: Colors.white),),
                      Text('VISIBILTY',style: TextStyle(color: Colors.white),),
                      Row(
                        children: [SizedBox(width: 155,height: 90,),
                              Text('min',style: TextStyle(color: Colors.white),),
                              Text('|',style: TextStyle(fontSize: 30,color: Colors.white),),
                              Text('max',style: TextStyle(color: Colors.white),),
                        ],
                      ),],),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),*/
      ),

    );
  }
}