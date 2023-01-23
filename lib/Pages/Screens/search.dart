import 'package:flutter/material.dart';

import '../../const.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
