import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../guitarTab/guitarTab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
    @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //categories
  List<String> categories = ["Popular", "Recommended", "Special Order", "Fresh Juice", "Trending", "Customize" ];
  int currentCategoryIndex = 0;
  bool searching = false;
  final _searchController = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    //add products
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu,color: Colors.black,),
        backgroundColor: Colors.transparent,
             elevation: 0,
        actions: const [
          Padding(padding: EdgeInsets.only(right: 50),
            child: Icon(Icons.print,color:Colors.black,))
        ],
      ),
      body:body(),
    );
  }
//body
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        _buildCategories(),
        _html()

      ],
    );
  }

  Widget _buildCategories() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20) ,
        child:
        SizedBox(
          height: 30,
          child: ListView.builder(
              itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return  currentCategoryIndex == index ? _buildCurrentCategory(index): _buildCategory(index);
              }
          ),
        )
    );
  }
  Widget _buildCurrentCategory(int index){
    return  Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        categories.elementAt(index),
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
      decoration:  BoxDecoration(
        color: Colors.black,
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
  Widget _buildCategory(index) {
    return  InkWell(
      onTap: (){
        setState(() {
          currentCategoryIndex = index;
        });
      },
      child:
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Text(
          categories.elementAt(index),
          style: const TextStyle(fontSize: 12,),
        ),
        decoration:  BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }


}

Widget _html() {
  return Column(
    children: [
      const Text("\nWorship"),
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Worship").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(snapshot.hasData) {
            final snap = snapshot.data!.docs;
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snap.length,
              itemBuilder: (context, index) {
                // return Container(
                //   height: 70,
                //   width: double.infinity,
                //   margin: const EdgeInsets.only(bottom: 12),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20),
                //     boxShadow: const [
                //       BoxShadow(
                //         color: Colors.black26,
                //         offset: Offset(2, 2),
                //         blurRadius: 10,
                //       ),
                //     ],
                //   ),
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

                              snap[index]['title'],
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
                          GuitarTab(title: snap[index]['title'],name:snap[index]['name'],url:snap[index]['url']);

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


}//product model class

