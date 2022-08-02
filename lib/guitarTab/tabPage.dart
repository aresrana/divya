import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:divya/screens/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/trial.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);


  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
int index =0;
final screens = [
  MyHomePage(),
  DashBoard(),
  MyHomePage(),
  MyHomePage(),
  MyHomePage()



];


  @override
  Widget build(BuildContext context) {
    final items =<Widget> [
      Icon(Icons.home,size: 17),
      Icon(Icons.home,size: 17),
      Icon(Icons.home,size: 17),
      Icon(Icons.home,size: 17),
      Icon(Icons.home,size: 17),


    ];

    return SafeArea(
        top: false,
        child:
      Scaffold(
      extendBody: true,
        body: screens[index],
  bottomNavigationBar: Theme (
    data: Theme.of(context).copyWith(
      iconTheme: IconThemeData(color : Colors.green)

    )
  ,child: CurvedNavigationBar(items:items,index: index,
    height: 45,

    backgroundColor: Colors.transparent,
    buttonBackgroundColor: Colors.red,
    onTap: (index)=> setState(() => this.index = index),


  ),
    )));
  }
}
