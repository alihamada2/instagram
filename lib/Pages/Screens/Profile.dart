import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../const.dart';
import 'EditProfile.dart';
import 'changeMypassword.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map userdata={};
int Followers=0;
int Following=0;
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
  Followers=userdata['followers'].length;
  Following=userdata['following'].length;
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
    Center(child: CircularProgressIndicator(color: blackColor,)) :
    Scaffold(
      appBar: AppBar(
          title:
              Text(
                userdata['UsersName'],
                style:
                TextStyle( color: blackColor, fontSize: 22),
              ),


          actions: [
            Icon(Icons.add_box_outlined,color: blackColor,),
            SizedBox(width: 20,),
            PopupMenuButton(
              itemBuilder: (context)=>[
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return changeMypassword();
                          },
                        ),
                      );
                    }, icon: Icon(Icons.edit,color: blackColor,)),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return changeMypassword();
                              },
                            ),
                          );
                        },
                        child:  Text('Change Password',style: TextStyle(color: blackColor),),
                      )
                    )
                  ],
                ),)
              ],
              child: Icon(Icons.menu,color: blackColor,),
            )
          ],

          backgroundColor: primaryColor
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:25 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/OIP.yKone516OU2IbQHoTC4HsQHaHa?pid=ImgDet&rs=1'),
                ),
                SizedBox(width: 50,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('2',style: TextStyle(fontSize: 15),),
                        Text('Posts',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(Followers.toString(),style: TextStyle(fontSize: 15),),
                        Text('Followers',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(Following.toString(),style: TextStyle(fontSize: 15),),
                        Text('Following',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            SizedBox(height: 18),
            Column(
              children: [
                SizedBox(width: 80,),
                Text('${userdata['UsersName']}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Text('   title: ${userdata['Title']}  '
                    'Age: ${userdata['Age']} ',maxLines: 3,style: TextStyle(fontSize: 14))
              ],
            ),
            Divider(
              color: primaryColor,
              thickness: 0.44,
            ),
            Row(
              children: [
                Container(
                    width: 200,
                    child: OutlinedButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return EditProfile();
                          }));
                        },
                        icon:Icon(Icons.edit,color: blackColor,),
                        label: Text('Edit profile',style: TextStyle(color: blackColor),))),
                SizedBox(width: 20,),

                Container(
                    width: 150,
                    child: OutlinedButton.icon(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.logout,color: Colors.red,),
                        label: Text('Log Out',style: TextStyle(color: Colors.red),))),

              ],
            ),
            Divider(
              color: blackColor,
              thickness: 0.44,
            ),
            SizedBox(height: 10,),
            Container(
              height: 500,
              child: GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3/2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemCount: 2,
                itemBuilder: (context,index){
                  return   ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.8kXstNAkabELsBc-mxFVygFYC1?pid=ImgDet&rs=1'

                      ,fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}