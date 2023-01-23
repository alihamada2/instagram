import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../const.dart';
class addPost extends StatefulWidget {
  const addPost({Key? key}) : super(key: key);

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {

File? file;
Future getphoto()async{
  final myfile = await ImagePicker().getImage(source: ImageSource.gallery);
  setState(() {
    file=File(myfile!.path);
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
      body: Center(
        child: IconButton(
          onPressed: (){
            getphoto();
          },
        icon: Icon(Icons.upload,color: blackColor,size: 50,),
        ),
      ),
    );
  }
}
