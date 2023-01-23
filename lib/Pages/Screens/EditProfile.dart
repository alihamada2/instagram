import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
class EditProfile extends StatefulWidget {
  const EditProfile ({Key? key}) : super(key: key);


  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController userNamecontroller = TextEditingController();

  TextEditingController titlecontroller = TextEditingController();

  Map userdata={};
  bool isloading=true;

final Firebase =FirebaseFirestore.instance;
UpdateData(){
Firebase.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).update({
  'UsersName':userNamecontroller.text,
  'Age':agecontroller.text,
  'Email':Emailcontroller.text,

  'Title':titlecontroller.text,
});
}
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
    return isloading?
    Center(child: CircularProgressIndicator(color: primaryColor,))
        :Scaffold(
      appBar: AppBar(
        title: Text('back' , style:
            TextStyle( color: blackColor, fontSize: 22,),),
       leading: IconButton(onPressed: (){
         Navigator.pop(context);
       },

       icon:Icon(Icons.arrow_back,color: blackColor,),
       ),
          backgroundColor: primaryColor
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 25,),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.yKone516OU2IbQHoTC4HsQHaHa?pid=ImgDet&rs=1'),
              ),
              SizedBox(height: 30,),
              Container(
                width: 200,
                height: 40,
                child: TextFormField(
                   controller: userNamecontroller ,
                    decoration: InputDecoration(
                      hintText: userdata['UsersName'],

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(66),

                      ),

                    )
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: 200,
                height: 40,
                child: TextFormField(
                  controller: agecontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: userdata['Age'],

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(66),

                      ),

                    )
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: 200,
                height: 40,
                child: TextFormField(
                    controller: titlecontroller,
                    decoration: InputDecoration(
                      hintText: userdata['Title'],

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(66),

                      ),

                    )
                ),
              ),
              SizedBox(height: 12,),
              Container(
                width: 200,
                height: 40,
                child: TextFormField(
                      controller: Emailcontroller,
                    decoration: InputDecoration(
                      hintText: userdata['Email'],

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(66),

                      ),

                    )
                ),
              ),
              SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                           UpdateData();

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
      ),
    );
  }
}
