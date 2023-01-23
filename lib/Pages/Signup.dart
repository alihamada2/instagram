import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Widget/EmailText.dart';
import '../Widget/PasswordText.dart';
import '../Widget/SnackBar.dart';
import '../const.dart';
import 'HomePage.dart';
import 'Login.dart';
import 'Model/UserModel.dart';
class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController Emailcontroller = TextEditingController();

  TextEditingController agecontroller = TextEditingController();

  TextEditingController userNamecontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  TextEditingController titlecontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  register()async{
    setState(() {
      isLoading = true;
    });

    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Emailcontroller.text,
        password: Passwordcontroller.text,
      );
    CollectionReference users= FirebaseFirestore.instance.collection('Users');

      Users user=Users(Email: Emailcontroller.text,Password: Passwordcontroller.text,Age: agecontroller.text,
          UsersName: userNamecontroller.text,Title: titlecontroller.text,
      Followers: [],
        Following: [],

      );
    users.doc(credential.user!.uid).set(user.tomap())

        .then((value) => print('User Added'))
        .catchError((error) => print('failed to add user: $error'));
    } on FirebaseAuthException catch (e) {
      ShowSnackBar(context, "ERROR :  ${e.code} ");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
              fontFamily: 'myfont', color: blackColor, fontSize: 40),
        ),
        centerTitle: true,
        backgroundColor:primaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Instagram',
                style: TextStyle(fontFamily: 'myfont', fontSize: 80),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  width: 290,
                  child: TextFormField(

                      controller: userNamecontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Your UserName:',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(66),

                        ),

                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 290,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                    controller: agecontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter Your age:',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(66),

                      ),

                    )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 290,
                  child: TextFormField(
                      controller: titlecontroller,
                      decoration: InputDecoration(
                        hintText: 'Enter Your title:',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(66),

                        ),

                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Emailfield(
                  controller: Emailcontroller,
                  hintText: 'Enter Your Email:',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Passwordfield(
                  controller: Passwordcontroller,
                  hintText: 'Enter Your Password:',

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 180,
                  child: OutlinedButton(
                      onPressed: () async{
                        await register();
                        if (!mounted) return;
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }
                        )

      );


                      },

                      child: isLoading?CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text('Sign Up',style: TextStyle(color: blackColor),))),
              Container(
                padding: EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    Text("You have an account? ",style: TextStyle(color: blackColor),),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text('Log In',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
