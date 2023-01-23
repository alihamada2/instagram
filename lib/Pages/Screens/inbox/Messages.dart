import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ChatScreen.dart';
class Messgags extends StatefulWidget {
  const Messgags({Key? key}) : super(key: key);

  @override
  State<Messgags> createState() => _MessgagsState();
}

class _MessgagsState extends State<Messgags> {
  Map userdata={};
  final Firebase =FirebaseFirestore.instance;
  bool isloading=true;
  getData()async{
    setState(() {
      isloading=true;
    });
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await Firebase.collection('Users').
      doc(FirebaseAuth.instance.currentUser!.uid).get();
      userdata = snapshot.data()!;
    }catch(e){
      print(e.toString());
    }
    setState(() {
      isloading=false;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('${userdata['UsersName']}',style: TextStyle(color: Colors.black),),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Chatscreen();
            }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Messages',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                    TextButton(onPressed: (){}, child: Text('Requests',style: TextStyle(color: Colors.grey),))
                  ],
                ),
              ),
              SizedBox(height: 2,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  
                  children: [

                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                          'https://th.bing.com/th/id/R.93e4d41cb450b4b08e16cb0fb2636047?rik=OzaQGqbR%2f5Ni%2fw&riu=http%3a%2f%2fblog.homerealestate.com%2fwp-content%2fuploads%2f2010%2f04%2fPerson.Ashley.jpg&ehk=a9kq7xFJPhBS%2fsZvdCRND1gfGKxZE1PYWZN0cSLoVuc%3d&risl=&pid=ImgRaw&r=0'),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        Text('Mohamed Ahmed',style: TextStyle(color: Colors.black,),),
                        Text('messages',style: TextStyle(color: Colors.black))
                      ],
                    ),
                    SizedBox(width: 150,),
                    Icon(Icons.camera_alt,color: Colors.black,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
