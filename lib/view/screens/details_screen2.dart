import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_state/utills/conts/color_manager.dart';
import 'package:real_state/utills/global/text.dart';

import '../../utills/sdp.dart';

class DetailsScreen2 extends StatefulWidget {
  static const String route = "/DetailsScreen";
  const DetailsScreen2({Key? key}) : super(key: key);

  @override
  State<DetailsScreen2> createState() => _DetailsScreen2State();
}

class _DetailsScreen2State extends State<DetailsScreen2> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: ColorManager.homeBg,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
            //  height: 600,
              //height: double.infinity,
              child: Stack(
               // fit: StackFit.expand,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: SDP.sdp(350),
                        //color: Colors.red,
                        width: double.infinity,
                        child: Image.asset("assets/vectors/home_screen/category/0.png", fit: BoxFit.cover,),
                      ),

                      Positioned.fill(
                        top: 50,
                        bottom: 230,
                        //bottom: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/vectors/details_screen/Back.png", fit: BoxFit.cover,),
                            txt18("Details"),
                            Image.asset("assets/vectors/details_screen/Icon.png"),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        top: 200,
                        bottom: 50,
                        left: 100,
                        right: 100,
                        child: Container(
                          height: 20,
                          width: 50,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

/*

import 'package:flutter/material.dart';

void main() {
 runApp( MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 title: 'Flutter Demo',
 theme: ThemeData(
 colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
 useMaterial3: true,
 ),
 home: MyHomePage(title: 'Flutter Demo Home Page'),
 );
 }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({Key? key, required this.title}) : super(key: key);

 final String title;

 @override
 _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 body: Container(
 color: Colors.white,
 child: CustomScrollView(
 slivers: [
 SliverAppBar(
 //appbar will not disapper
 pinned: true,
 //when scroll down star then image will start showing
 floating: true,
 expandedHeight: 250,
 title: const Text("Name"),
 flexibleSpace: Container(
 child: Stack(
 children: [
 FlexibleSpaceBar(
 background: Image.asset(
 "assets/0.png",
 width: double.infinity,
 // height: 300,
 fit: BoxFit.cover,
 ),
 ),
 Container(
 margin: EdgeInsets.only(top: 230),
 height: 100,
 decoration: BoxDecoration(
 color: Colors.white,
 borderRadius: BorderRadius.only(
 topLeft: Radius.circular(20),
 topRight: Radius.circular(20),
 ),
 ),
 ),
 ],
 ),
 )
 ),

 SliverList(
 delegate: SliverChildListDelegate(
 [
 Container(
 height: 300,
 decoration: BoxDecoration(
 color: Colors.white,
 borderRadius: BorderRadius.only(
 topLeft: Radius.circular(50),
 topRight: Radius.circular(50),
 ),
 ),
 ),
 Container(
 height: 300,
 decoration: BoxDecoration(
 color: Colors.white,
 borderRadius: BorderRadius.only(
 topLeft: Radius.circular(20),
 topRight: Radius.circular(20),
 ),
 ),
 ),
 Container(
 height: 300,
 color: Colors.white,
 ),
 Container(
 height: 300,
 color: Colors.white,
 ),
 ],
 ),
 ),
 ],
 ),
 ),
 );
 }
}

*/