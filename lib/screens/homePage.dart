

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:divya/screens/Worship.dart';
import 'package:divya/screens/trial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:divya/guitarTab/playerPage.dart';
import 'package:page_transition/page_transition.dart';


class MyHomePage extends StatefulWidget {
    Function _miniPlayer;

   MyHomePage(this._miniPlayer);


 // const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState(_miniPlayer);
}

class _MyHomePageState extends State<MyHomePage> {
  final  Function _miniPlayer;

  _MyHomePageState(this._miniPlayer);

  int currentCategoryIndex = 0;
  bool searching = false;

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
      Scaffold(
      body: body(),
      ));
  }

//body
  Widget body() {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(
            height: 5,
          ),
          Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: const [
                    Text('Dear Ashish', style: TextStyle(fontSize: 18)),
                    Text('PRAISE THE LORD',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.indigo)),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                  CircleAvatar(
                    radius: 25,
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          _songs(context),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(children: const [
                Icon(
                  Icons.church_sharp,
                  color: Colors.indigo,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Meetings',
                  style: TextStyle(fontSize: 18),
                )
              ])),
          SizedBox(
            height: 20,
          ),
          _meetings(context),
          SizedBox(
            height: 20,
          ),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(children: const [
                Icon(
                  Icons.music_note_sharp,
                  color: Colors.indigo,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Guitar Chords',
                  style: TextStyle(fontSize: 18),
                )
              ])),
          const SizedBox(
            height: 20,
          ),
          _guitarChord(context),
          const SizedBox(
            height: 20,
          ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(children: const [
                    Icon(
                      Icons.music_note_sharp,
                      color: Colors.indigo,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Recommended Songs',
                      style: TextStyle(fontSize: 18),
                    )
                  ])),


              _recommended(_miniPlayer),
              const SizedBox(
                height: 50,
              ),

            ]));

    // _html(context)
  }
}



Widget _songs(BuildContext context) {
  return CarouselSlider(
    items: [
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/worship.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {
         Navigator.push(context,MaterialPageRoute(builder: (context) => WorshipPage())
                    );


        },
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/pray.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/witness.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/rapture.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      )
    ],
    options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.27,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        reverse: true,
        viewportFraction: 0.8),
  );
}

Widget _meetings(BuildContext context) {
  return CarouselSlider(
    items: [
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              image: DecorationImage(
                  image: AssetImage('images/worship.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/pray.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/witness.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
      GestureDetector(
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(0)),
              image: DecorationImage(
                  image: AssetImage('images/rapture.jpg'), fit: BoxFit.cover)),
        ),
        onTap: () {},
      ),
    ],
    options: CarouselOptions(
        aspectRatio: 1,
        height: MediaQuery.of(context).size.height * 0.2,
        autoPlay: true,
        autoPlayCurve: Curves.decelerate,
        enlargeCenterPage: true,
        reverse: true,
        viewportFraction: 0.4),
  );
}

Widget _guitarChord(BuildContext context) {
  return GestureDetector(
      child: Container(
        height: 140,
        width: 140,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            image: DecorationImage(
                image: AssetImage('images/worship.jpg'), fit: BoxFit.cover)),
      ),
      onTap: () =>
          Navigator.of(context).push(

          PageTransition(
          child: DashBoard(), type: PageTransitionType.rightToLeft,

        duration: Duration(milliseconds: 600),
            reverseDuration: Duration(milliseconds: 600),
            opaque: false

      ))

  );
}
Widget _recommended(_miniPlayer) {
  return Column(
    children: [

      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Worship").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData) {
            final snap = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snap.length,
              itemBuilder: (context, index) {
                         return Stack(
                    children: [
                      GestureDetector(
                        child:Container(

                          height:50,
                      width: MediaQuery.of(context).size.width,


                      child: Card(
                        child: Center(
                          child: Row (
                            children : [
                                                 Text(

                          snap[index]['name'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                            SizedBox(width:50),
                            Text(

                              snap[index].['title'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                       )),
                      )),
                        onTap: () {

                           var ur= snap[index]['url'];
                           var ti =snap[index]['title'];
                           var music =snap[index]['music'];


                
                          _miniPlayer(url:ur,le:ti,music:music);

                        },

                      )
                      ],
                //   ),
                 );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      )
    ],

  );


}

