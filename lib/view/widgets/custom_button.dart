
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  String? title;
  bool? isSelected;
  Function? onTap;
  String? filterText;
  double? padding;
  Color? buttonColor;

    CustomButton(
       this.title,
      {
        this.onTap,
        this.filterText,
        this.padding = 8,
        this.buttonColor = Colors.white,
        this.isSelected = false,
        Key? key

       }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          //color: bgColor
          color: isSelected! ? Colors.blue : buttonColor,
        ),
          child: Padding(
            padding: padding == null ? EdgeInsets.all(0) : EdgeInsets.all(padding!),
            child: Text(title!),
          ),
      ),
    );
  }

}





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


// import 'package:flutter/material.dart';
//
// class CustomButton extends StatefulWidget {
//    String? title;
//    Function? onTap;
//    double? padding;
//    Color? bgColor;
//
//    CustomButton({
//     Key? key,
//     this.title,
//     this.onTap,
//     this.padding = 8,
//     this.bgColor = Colors.white,
//   }) : super(key: key);
//
//   @override
//   _CustomButtonState createState() => _CustomButtonState();
// }
//
// class _CustomButtonState extends State<CustomButton> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isSelected = !isSelected;
//         });
//        // widget.onTap!();
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: isSelected ? Colors.blue : widget.bgColor,
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(widget.padding!),
//           child: Text(widget.title!),
//         ),
//       ),
//     );
//   }
// }



