import 'package:flutter/material.dart';
class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/R.93e4d41cb450b4b08e16cb0fb2636047?rik=OzaQGqbR%2f5Ni%2fw&riu=http%3a%2f%2fblog.homerealestate.com%2fwp-content%2fuploads%2f2010%2f04%2fPerson.Ashley.jpg&ehk=a9kq7xFJPhBS%2fsZvdCRND1gfGKxZE1PYWZN0cSLoVuc%3d&risl=&pid=ImgRaw&r=0'),
            ),
            SizedBox(width: 15,),
            Text('Mohamed Ahmed',style: TextStyle(color: Colors.black),),
          ],
        ),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.call,color: Colors.black,),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.video_call,color: Colors.black,))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'send',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
