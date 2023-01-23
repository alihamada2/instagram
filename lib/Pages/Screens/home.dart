import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram/Pages/Screens/inbox/Messages.dart';
import '../../const.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final fireStore = FirebaseFirestore.instance;
  int like = 0;
  bool islike = false;

  contLike() {
    setState(() {
      islike = true;
    });
    if (like == 0) {
      like++;
    } else {
      like--;
    }
    setState(() {
      islike = true;
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
          backgroundColor: primaryColor,
          actions: [
            IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.favorite_border,
                  color: blackColor,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Messgags();
                  }));
                },
                icon: Icon(
                  Icons.send_sharp,
                  color: blackColor,
                )),
          ],
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.camera_alt,
                color: blackColor,
              )),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('Users').snapshots(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              'https://th.bing.com/th/id/OIP.yKone516OU2IbQHoTC4HsQHaHa?pid=ImgDet&rs=1'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                '${snapshot.data!.docs[index]['UsersName']}'),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Cairo,Egypt'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: blackColor,
                                        )),
                                  ]),
                            ),
                            Image.network(
                              'https://th.bing.com/th/id/OIP.8kXstNAkabELsBc-mxFVygFYC1?pid=ImgDet&rs=1',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 3,
                              width: double.infinity,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              contLike();
                                            });
                                          },
                                          icon: islike ? Icon(
                                                  Icons.favorite,
                                                  size: 35,
                                                  color: Colors.red,
                                                )
                                              : Icon(
                                                  Icons.favorite_border,
                                                  size: 35,
                                                )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.comment,
                                            size: 35,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.share,
                                            size: 35,
                                          )),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.bookmark_outline,
                                        size: 35,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    '$like likes',
                                    style: TextStyle(
                                        color: secondaryColor, fontSize: 15),
                                  ),
                                )),
                            Row(
                              children: [
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  '${snapshot.data!.docs[index]['UsersName']}',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(255, 189, 196, 199)),
                                ),
                                Text(
                                  " My First Photo ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          Color.fromARGB(255, 189, 196, 199)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'view all 100 comments',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(214, 157, 157, 165),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 9, 10),
                                width: double.infinity,
                                child: Text(
                                  "10June 2022",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(214, 157, 157, 165)),
                                  textAlign: TextAlign.start,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 26,
                                          backgroundImage: NetworkImage(
                                              'https://th.bing.com/th/id/OIP.yKone516OU2IbQHoTC4HsQHaHa?pid=ImgDet&rs=1'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                                '${snapshot.data!.docs[index]['UsersName']}'),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text('Giza, Egypt'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: blackColor,
                                        )),
                                  ]),
                            ),
                            Image.network(
                              'https://th.bing.com/th/id/OIP.f31u9t4WVXfwotMF13HYEQHaFj?pid=ImgDet&rs=1',
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height / 3,
                              width: double.infinity,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              contLike();
                                            });
                                          },
                                          icon: islike ? Icon(
                                            Icons.favorite,
                                            size: 35,
                                            color: Colors.red,
                                          )
                                              : Icon(
                                            Icons.favorite_border,
                                            size: 35,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.comment,
                                            size: 35,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.share,
                                            size: 35,
                                          )),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.bookmark_outline,
                                        size: 35,
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: double.infinity,
                                child: Text(
                                  ' $like likes',
                                  style: TextStyle(
                                      color: secondaryColor, fontSize: 15),
                                )),
                            Row(
                              children: [
                                SizedBox(
                                  width: 9,
                                ),
                                Text(
                                  '${snapshot.data!.docs[index]['UsersName']}\t',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(255, 189, 196, 199)),
                                ),
                                Text(
                                  "Buckyball models ",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 189, 196, 199)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'view all 20 comments',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(214, 157, 157, 165),
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 9, 10),
                                width: double.infinity,
                                child: Text(
                                  "9Aug 2022",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(214, 157, 157, 165)),
                                  textAlign: TextAlign.start,
                                )),
                          ],
                        ),
                      );
                    })
                : snapshot.hasError
                    ? Center(child: Text('Error'))
                    : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
