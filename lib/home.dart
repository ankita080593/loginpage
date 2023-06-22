import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String uname='';

  Future<void> getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var getuname= await prefs.getString('uname');

    setState(() {
      uname=getuname.toString();
    });
  }
  @override
  void initState(){
    super.initState();
    getdata();
  }
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(uname!),),);
  }
}
