import 'package:flutter/material.dart';
import 'package:loginpage/home.dart';
import 'package:loginpage/registrationpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var secure=true;
  TextEditingController uname=TextEditingController();
  TextEditingController pass=TextEditingController();
  final keys=GlobalKey<FormState>();
  void Loginuser() async{
    if(uname.text=='ankita'&& pass.text=='123'){
      final SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString('uname', uname.text.toString());
      prefs.setString('pass', pass.text.toString());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()));
    }else{
      print('Invalid Username or Password');
    }
  }
  Future<void>autologin() async{
    final SharedPreferences prefs=await SharedPreferences.getInstance();
    var getuname=await prefs.getString('');
    if(getuname !=null){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>home()));
    }
  }
  @override
  void initState(){
    super.initState();
    autologin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pinkAccent,
        title: Text('Login Page'),
      ),
      body: Form(key:keys,
        child: Column(
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: uname,
              validator: (value){
                if (value==null|| value.isEmpty){
                  return 'Uname is Required';
                }
              },
              decoration: InputDecoration(border: InputBorder.none,
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color: Colors.blueAccent),
                    borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),),
                hintText: 'User Name',
                prefixIcon: Icon(Icons.person),

              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: pass,
              obscureText: secure,
              validator: (value){
                if (value==null|| value.isEmpty){
                  return 'Password is Required';
                }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                  return 'please enter a valid password ';
                }
                return null;
              },
              decoration: InputDecoration(border: InputBorder.none,
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                    borderSide:BorderSide(color: Colors.blueAccent) ),
                enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.elliptical(30,30)),
                    borderSide: BorderSide(width: 1,color: Colors.black)),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      secure=!secure;
                    });
                  },icon: secure?Icon(Icons.visibility):Icon(Icons.visibility_off),)
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),onPressed: (){
                if (keys.currentState!.validate()){
                  Loginuser();
                }
              },
              child: Text('Login'),),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: ElevatedButton(style:ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pinkAccent)),
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>registrationpage()));

              },
                child: Text('Register Now'),),
            )
          ],
        ),
      ),
    );
  }
}
