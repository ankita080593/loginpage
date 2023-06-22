import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class registrationpage extends StatefulWidget {
  const registrationpage({Key? key}) : super(key: key);

  @override
  State<registrationpage> createState() => _registrationpageState();
}

class _registrationpageState extends State<registrationpage> {
  TextEditingController pass = TextEditingController();
  TextEditingController uname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  bool valuefirst = false;
  var secure = true;
  final keys = GlobalKey<FormState>();

  Future<void> submitform() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Registration Form'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.pinkAccent, Colors.yellow],
        )),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: keys,
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is Required';
                    } else if (!value.contains('@')) {
                      return 'please enter a valid emaiil ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30))),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                    ),
                    hintText: 'Email Adress',
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile Number is Required';
                    }else if(value.length!=10){
                      return 'please enter a valid mobile number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30))),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                    ),
                    hintText: 'Mobile Number',
                    prefixIcon: Icon(Icons.call),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: uname,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Uname is Required';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(30, 30))),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.blueAccent),
                      borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                    ),
                    hintText: 'User Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: pass,
                  obscureText: secure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is Required';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return 'please enter a valid password ';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(30, 30)),
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(30, 30)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.black)),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secure = !secure;
                          });
                        },
                        icon: secure
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      value: this.valuefirst,
                      onChanged: (bool? value) {
                        print(value);
                        setState(() {
                          this.valuefirst = value!;
                        });
                      },
                    ),
                    Text(
                      'I Agree to the Terms',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                IgnorePointer(
                  ignoring: !valuefirst,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: ()async {
                        if (keys.currentState!.validate()) {
                          var formdata = {
                            'uname': uname.text,
                            'pass': pass.text,
                            'mob': number.text,
                            'email': email.text
                          };
                          print(jsonEncode(formdata));
                          var response = await http.post(
                              Uri.parse('https://ntce.000webhostapp.com/api.php'),
                              body:jsonEncode(formdata)
                          );
                          if (response.statusCode == 200) {
                            var data = await jsonDecode(response.body);
                            print(data);
                           // print(response.body);
                          } else {
                            print('something went wrong');
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.yellow.shade900),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
