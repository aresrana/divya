
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../screens/trial.dart';

class GuitarTab extends StatefulWidget {
  late final String title;
  late final String name;
  late final String url;

   GuitarTab({Key? key, required name, required title, required url}) : super(key: key);


  @override
  State<GuitarTab> createState() => _GuitarTabState();
}

class _GuitarTabState extends State<GuitarTab> {
  late final String title;
  late final String name;
  late final String url;


  @override
  Widget build(BuildContext context) {
        return SafeArea(
        top: false,
        child:
        Scaffold(
            extendBody: true,
            body: Container (
              child: Column (
            children: [
           WebViewPlus (

                initialUrl: url,
              ),
              Text(url),


                ]




            )



        )));
  }
}
