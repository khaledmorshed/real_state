import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utills/global/text.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          txt18("Explore Your Dream Place", fontWeight: FontWeight.w500),
          Row(
            children: [
                Container(
                  child: TextButton(
                    onPressed: (){},
                    child: Text("All"),
                  ),
                ),

            ],

          ),
        ],
      ),
    );
  }
}
