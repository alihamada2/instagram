import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/add_post.dart';
import 'Screens/favourite.dart';
import 'Screens/home.dart';
import 'Screens/Profile.dart';
import 'Screens/search.dart';
import '../const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
 int current =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: primaryColor,
        onTap: (index){
      _pageController.jumpToPage(index);
      setState(() {
          current=index;
            });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: current==0 ? blackColor:secondaryColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: current==1? blackColor:secondaryColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: current==2 ?blackColor:secondaryColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: current==3 ?blackColor:secondaryColor,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: current==4 ?blackColor:secondaryColor,
              ),
              label: ''),
        ],
      ),
      body:PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Home(),
          search(),
          addPost(),
          Favourite(),
          Profile(),
        ],

      ),
    );
  }
}
