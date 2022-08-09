import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:divya/screens/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '../screens/trial.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int index = 0;
  final screens = [
    MyHomePage(),
    DashBoard(),
    MyHomePage(),
    MyHomePage(),
    MyHomePage()
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
      Icon(Icons.home, size: 17),
    ];

    return SafeArea(
      top: false,
      child:  Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            items: items,
            index: index,
            height: 55,
            color: Colors.indigo,
            backgroundColor: Colors.white,
            buttonBackgroundColor: Colors.indigo,
            onTap: (index) => setState(() => this.index = index),
          ),
        ),
        floatingActionButton: _playerControl(context),
      ),
    );
  }

  Widget _playerControl(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
              topLeft: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0)),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 6),
              child: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 22,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.indigo,
                  ),
                ),
                onTap: () {
                  print('ares');
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: EdgeInsets.only(left:5),
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                      children: [

                Expanded(
                               child: Marquee(
                    textDirection: TextDirection.ltr,
                       velocity: 30,
                  blankSpace: 90,
                  //pauseAfterRound: const Duration(seconds: 2),
                  text: 'aresrana magar is my name',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ))],

    ))
          ],
        ));
  }
}
