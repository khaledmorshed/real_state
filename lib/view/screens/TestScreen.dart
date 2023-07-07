import 'package:flutter/material.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/view/widgets/appbar/bottom_nav_bar_widget.dart';
import 'package:real_state/view/widgets/drawer/left_drawer.dart';

import '../../utills/sdp.dart';
import '../widgets/details_widgets/add_review_details_widget.dart';
import '../widgets/details_widgets/contact_details_widget.dart';
import '../widgets/details_widgets/facilities_details_widget.dart';
import '../widgets/details_widgets/map_details_widget.dart';
import '../widgets/details_widgets/review_details_widget.dart';

class TestScreen extends StatefulWidget {
  static const String route = "/TestScreen";
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: LeftDrawer(),
      bottomNavigationBar: BottomNavBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MapDetailsWidget(),
              szH20(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  txt16("Description", fontWeight: FontWeight.w500),
                  szH10(),
                  txt12("this is description")
                ],
              ),
              FacilitiesDetailsWidget(),
              szH20(),
              ContactDetailsWidget(),
              szH50(),
              ReviewDetailsWidget(),
              szH50(),
              AddReviewDetailsWidget(),
              szH50(),
            ],
          )
        ),
      ),
    );
  }
}
