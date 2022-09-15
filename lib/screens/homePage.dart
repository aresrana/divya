import 'package:divya/extra/Worship.dart';
import 'package:divya/screens/prayer.dart';
import 'package:divya/screens/trial.dart';

import 'package:divya/services/song_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../componet/song_widget.dart';
import '../model/song.dart';
import '../services/auth.dart';
import 'worship.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentCategoryIndex = 0;
  final User? user = Auth().currentUser;
  bool searching = false;
  //1-first create a song list that you gonna display in the page
  List<Song> _songList = [];
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    //2-get the song list from the provider and set it to the list that we created
    Provider.of<SongProvider>(context, listen: false)
        .getSongsByCollection('Worship')
        .then((value) {
      setState(() {
        _songList = value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print(user?.email);
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<SongProvider>();
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
            body: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          const SizedBox(height: 5),
          Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children:  [
                    Text('Dear ${user?.email}', style: TextStyle(fontSize: 18)),
                    const Text('PRAISE THE LORD',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.indigo)),
                    SizedBox(height: 20),
                  ]),
                  const CircleAvatar(radius: 25),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          _songs(context),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: const [
                Icon(Icons.church_sharp, color: Colors.indigo, size: 20),
                SizedBox(width: 10),
                Text('Meetings', style: TextStyle(fontSize: 18))
              ])),
          const SizedBox(
            height: 20,
          ),
          _meetings(context),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(children: const [
                Icon(Icons.music_note_sharp, color: Colors.indigo, size: 20),
                SizedBox(width: 10),
                Text('Guitar Chords', style: TextStyle(fontSize: 18))
              ])),
          const SizedBox(height: 20),
          _guitarChord(context),
          const SizedBox(height: 20),
          // Container(
          //     padding: const EdgeInsets.only(left: 10),
          //     child: Row(children: const [
          //       Icon(Icons.music_note_sharp, color: Colors.indigo, size: 20),
          //       SizedBox(width: 10),
          //       Text('Recommended Songs', style: TextStyle(fontSize: 18))
          //     ])),
          //             const SizedBox(height: 15),
          // provider.isLoading
          //     ? const CircularProgressIndicator()
          //     //4-Create your own widget to display the song list i recommend keeping this one
          //     : ListView.builder(
          //         shrinkWrap: true,
          //         primary: false,
          //         padding: const EdgeInsets.symmetric(horizontal: 10),
          //         itemCount: _songList.length,
          //         itemBuilder: (context, index) {
          //           final song = _songList[index];
          //           //5-pass the song and the song list to SongWidget
          //           return SongWidget(song: song, playingSongList: _songList);
          //         },
          //       ),
          // const SizedBox(height: 50),
        ]))
            // _html(context)

            ));
  }

//body

}

Widget _songs(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height*0.3,
    child: CarouselSlider(
    items: [
      GestureDetector(
        child: Container(
          decoration:  BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  //spreadRadius: 3.0,
                  //blurRadius: 3.0,
                  //offset: Offset(6,2)

              ),
              BoxShadow(
                  color: Color.fromRGBO(255,255,255, 0.9),
                  //spreadRadius: 3.0,
                //  blurRadius: 3.0,
                  //offset: Offset( -6,2)

              ),

            ],
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border:Border.all(
                color:Colors.grey.shade300,
                width:8
            ),
            image: const DecorationImage(
                image: AssetImage('images/worship.jpg'),
                fit: BoxFit.cover),

          ),
          //
          // decoration: const BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(12)),
          //     image: DecorationImage(
          //         image: AssetImage('images/worship.jpg'), fit: BoxFit.cover)


        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WorshipSongPage()));
        },
      ),
      GestureDetector(
        child: Container(

          width: MediaQuery.of(context).size.width*.7,
          decoration:  BoxDecoration(
            color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow:  [
              BoxShadow(
                  color: Colors.grey[500]!,
                  // Color.fromRGBO(128, 128, 128, 0.1),
                  spreadRadius: 1.0,
                  blurRadius: 15.0,
                  offset: Offset(4,4)

              ),
              BoxShadow(
                  color: Colors.grey[300]!,
                  //Color.fromRGBO(228,228,228, 0.6),
                  spreadRadius: 1.0,
                  blurRadius: 15.0,
                  offset: Offset( -4,-4)

              ),

            ],



              // image: DecorationImage(
              //     image: AssetImage('images/pray.jpg'), fit: BoxFit.cover)

          ),
          child: Center(
          child:          Text('Pray',style: TextStyle(fontSize: 50,color: Colors.red),),
        )),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PrayerPage()));
        },
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
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PrayerPage()));
        },
      )
    ],
    options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.27,
        autoPlay: true,
        autoPlayCurve: Curves.easeInOut,
        enlargeCenterPage: true,
        reverse: true,
        viewportFraction: 0.8),
  ));
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
      onTap: () => Navigator.of(context).push(PageTransition(
          child: const DashBoard(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 600),
          reverseDuration: const Duration(milliseconds: 600),
          opaque: false)));
}
