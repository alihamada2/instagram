import 'package:flutter/material.dart';

import '../../const.dart';
class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
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
    );
  }
}
