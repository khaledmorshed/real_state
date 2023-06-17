import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:real_state/providers/home_screen_provider.dart';
import 'package:real_state/utills/global/size_box.dart';
import 'package:real_state/utills/global/text.dart';

import '../../utills/conts/color_manager.dart';
import '../../utills/sdp.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Scaffold(
      backgroundColor: ColorManager.homeBg,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: ColorManager.homeBg,

        title: txt18("Explore Your Dream Place"),
      ),

      body: SafeArea(
        child: Consumer<HomeScreenProvider>(
          builder: (context, _provider, _) {
            return Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      //color: Colors.green,
                      child:
                      GridView.custom(
                        dragStartBehavior: DragStartBehavior.start,
                        gridDelegate: SliverStairedGridDelegate(
                          //crossAxisSpacing: 10,
                          //mainAxisSpacing: 10,
                          startCrossAxisDirectionReversed: true,
                          pattern: [
                            StairedGridTile(1, 1),
                            StairedGridTile(0.5, 0.5),
                            StairedGridTile(0.5, 0.5),

                          ],
                        ),

                        childrenDelegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 15),
                              child: Container(
                               // color: Colors.red,
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          _provider.dummyImage[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                    Positioned.fill(
                                      top: SDP.sdp(300),
                                      bottom:  15,
                                        child: Column(
                                          children: [
                                            txt16("Apartent", fontWeight: FontWeight.w500),
                                            szH10(),
                                            txt12("5 properties")
                                          ],
                                        ),
                                    )

                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: _provider.dummyImage.length,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
