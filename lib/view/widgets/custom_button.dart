import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  String? title;
  bool? isSelected;
  Function? onTap;
  String? filterText;
  double? padding;
  Color? bgColor;

    CustomButton(
       this.title,
      {
        this.onTap,
        this.filterText,
        this.padding = 8,
        this.bgColor = Colors.white,
        this.isSelected,
        Key? key

       }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: bgColor
        ),
          child: Padding(
            padding: padding == null ? EdgeInsets.all(0) : EdgeInsets.all(padding!),
            child: Text(title!),
          ),
      ),
    );
  }
}




//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../utills/global/global.dart';
//
// class CustomButton extends StatelessWidget {
//
//   String? title;
//   bool? isSelected;
//   Function? onTap;
//   String? filterText;
//   double? padding;
//   Color? bgColor;
//
//   CustomButton(
//       this.title,
//       {
//         this.onTap,
//         this.filterText,
//         this.padding = 8,
//         this.bgColor = Colors.white,
//         this.isSelected,
//         Key? key
//
//       }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//         valueListenable: obSecureValue,
//         builder: (context, value, _) {
//           return GestureDetector(
//             onTap: onTap != null ? () => onTap!() : null,
//             child: Container(
//
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: bgColor
//               ),
//               child: Padding(
//                 padding: padding == null ? EdgeInsets.all(0) : EdgeInsets.all(padding!),
//                 child: Text(title!),
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
