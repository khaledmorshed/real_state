import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomReviewWidget extends StatelessWidget {
  int? value;
  bool? isSelected;
  Function? onTap;
   CustomReviewWidget({Key? key, this.value, this.isSelected, this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
          child: value!  > 0 && isSelected! ? Image.asset("assets/vectors/details_screen/star_color.png", /*color: Colors.blue,*/ height: 40,) : Image.asset("assets/vectors/details_screen/star_not_color.png", height: 40,),
      ),
    );
  }
}
