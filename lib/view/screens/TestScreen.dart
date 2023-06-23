import 'package:flutter/material.dart';
import 'package:real_state/view/widgets/appbar/bottom_nav_bar_widget.dart';
import 'package:real_state/view/widgets/drawer/left_drawer.dart';

class TestScreen extends StatefulWidget {
  static const String route = "/TestScreen";
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: LeftDrawer(),
      bottomNavigationBar: BottomNavBarWidget(),
      body: Container(
        height: double.infinity,
       // color: Colors.red,
        child: Text("dfdf"),
      ),
    );
  }
}
