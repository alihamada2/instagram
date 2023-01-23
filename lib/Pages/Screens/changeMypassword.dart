import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
class changeMypassword extends StatefulWidget {
  const changeMypassword({Key? key}) : super(key: key);

  @override
  State<changeMypassword> createState() => _changeMypasswordState();
}

class _changeMypasswordState extends State<changeMypassword> {
  TextEditingController Passwordcontroller = TextEditingController();
  final Firebase =FirebaseFirestore.instance;
  UpdatePassword(){
    Firebase.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
      'Password':Passwordcontroller.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
              fontFamily: 'myfont', color: blackColor, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      body:  Center(
        child: Column(

          children: [
            SizedBox(height: 150,),
            Container(
              width: 200,
              height: 40,
              child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter a old password',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(66),

                    ),

                  )
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 200,
              height: 40,
              child: TextFormField(
                  controller: Passwordcontroller,
                  decoration: InputDecoration(
                    hintText: 'Enter a new password',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(66),

                    ),

                  )
              ),
            ),
            SizedBox(height: 40,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        UpdatePassword();

                      },
                      child: Text('Edit'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green)),
                    )
                ),
                Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cansel'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
