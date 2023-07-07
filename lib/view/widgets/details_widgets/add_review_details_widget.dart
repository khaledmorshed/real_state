import 'package:flutter/cupertino.dart';

import '../custom_review_widget.dart';

class AddReviewDetailsWidget extends StatefulWidget {
  const AddReviewDetailsWidget({Key? key}) : super(key: key);

  @override
  State<AddReviewDetailsWidget> createState() => _AddReviewDetailsWidgetState();
}

class _AddReviewDetailsWidgetState extends State<AddReviewDetailsWidget> {
  List l = [1,2,3,4,5];

  int value = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Wrap(
        children: l.map((e) {
          int index = l.indexOf(e);
          //value = index;
          value--;
          print("val.....$value");
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomReviewWidget(

              isSelected: value>0 ? true : false,
              value: value,
              onTap: (){
                setState(() {
                  // value = index;
                  //value--;
                  value = index+2;
                });
              },
            ),
          );

          // if(value>0) {
          //   value--;
          //   return Padding(
          //     padding: const EdgeInsets.only(right: 8.0),
          //     child: Image.asset("assets/vectors/details_screen/star_color.png"),
          //   );
          // }
          // else {
          //   value--;
          //   return Padding(
          //     padding: const EdgeInsets.only(right: 8.0),
          //     child: Image.asset("assets/vectors/details_screen/star_not_color.png"),
          //   );
          // }

        }).toList(),


      ),
    );
  }
}
