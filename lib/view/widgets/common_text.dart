import 'package:flutter/material.dart';

import '../../utills/sdp.dart';

//const String yugothib = "Yugothib";
const String poppins = "Poppins";
//enum FF { Yugothib }
enum FontFamily { Poppins }

class CommonText extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double size;
  final TextAlign textAlignment;
  final TextOverflow textOverflow;
  final Color textColor;
  final FontFamily fontFamily;


  const CommonText(
      this.title, {
        Key? key,
        this.fontWeight = FontWeight.normal,
        this.size = 14,
        this.textAlignment = TextAlign.start,
        this.textOverflow = TextOverflow.visible,
        this.textColor = Colors.black,
        this.fontFamily = FontFamily.Poppins,
        this.fontStyle = FontStyle.normal
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    // TextStyle tStyle = Theme.of(context).textTheme.headline1!;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Text(
        title,
        textAlign: textAlignment,
        overflow: textOverflow,
        style: TextStyle(
            fontSize: SDP.sdp(size),
            color: textColor,
            fontWeight: fontWeight == FontWeight.bold ? FontWeight.w900 : fontWeight,
            fontFamily: poppins),
      ),
    );
  }
}

// class AutoText extends StatelessWidget {
//   final String title;
//   final FontWeight fWeight;
//   final double size;
//   final TextAlign textAlignment;
//   final TextOverflow textOverflow;
//   final Color color;
//   final FF fF;
//   final int maxLines;
//
//   const AutoText(
//       this.title, {
//         Key? key,
//         this.fWeight = FontWeight.normal,
//         this.size = 14,
//         this.textAlignment = TextAlign.start,
//         this.textOverflow = TextOverflow.visible,
//         this.color = Colors.black,
//         this.fF = FF.Yugothib,
//         this.maxLines = 1,
//       }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TextStyle tStyle = Theme.of(context).textTheme.headline1!;
//     return AutoSizeText(
//       title,
//       textAlign: textAlignment,
//       overflow: textOverflow,
//       style: TextStyle(
//           fontSize: SDP.sdp(size),
//           color: color,
//           fontWeight: fWeight == FontWeight.bold ? FontWeight.w900 : fWeight ,
//           fontFamily: yugothib),
//       maxLines: maxLines,
//     );
//   }
// }
//
// class CustomBackground extends StatelessWidget {
//   final Color topColor;
//   final Color bottomColor;
//
//   CustomBackground(this.topColor, this.bottomColor);
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     var height = MediaQuery.of(context).size.height;
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: bottomColor,
//         ),
//         Container(
//           width: double.infinity,
//           height: height - SDP.sdp(150),
//           decoration: BoxDecoration(
//               color: topColor,
//               shape: BoxShape.rectangle,
//               borderRadius:  BorderRadius.only(
//                 bottomLeft: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//                 bottomRight: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//               )
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class CustomQuizBackground extends StatelessWidget {
//   final Color topColor;
//   final Color bottomColor;
//   final Color marker;
//   final bool isQuiz;
//
//   CustomQuizBackground(this.topColor, this.bottomColor, this.marker, this.isQuiz);
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     var height = MediaQuery.of(context).size.height;
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: bottomColor,
//         ),
//         Container(
//           width: double.infinity,
//           height: height - SDP.sdp(150),
//           decoration: BoxDecoration(
//               color: topColor,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//                 bottomRight: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//               )
//           ),
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: Padding(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             child: Container(
//               width: SDP.sdp(90),
//               height: SDP.sdp(50),
//               decoration: BoxDecoration(
//                   color: marker,
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(SDP.sdp(50)),
//                     // bottomRight: Radius.circular(SDP.sdp(40))
//                   )
//               ),
//             ),
//           ),
//         ),
//         isQuiz ? Align(
//           alignment: Alignment.bottomCenter,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Container(
//                 width: double.infinity,
//                 height: height / 2,
//                 decoration: BoxDecoration(
//
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40)))),
//           ),
//         ) : Container(),
//       ],
//     );
//   }
// }
//
// class CustomFlashCardBackground extends StatelessWidget {
//   final Color topColor;
//   final Color bottomColor;
//
//   CustomFlashCardBackground(this.topColor, this.bottomColor);
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     var height = MediaQuery.of(context).size.height;
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: double.infinity,
//           color: bottomColor,
//         ),
//         Container(
//           width: double.infinity,
//           height: height - SDP.sdp(150),
//           decoration: BoxDecoration(
//               color: topColor,
//               shape: BoxShape.rectangle,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//                 bottomRight: Radius.elliptical(SDP.sdp(350),SDP.sdp(65)),
//               )
//           ),
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: Padding(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//             child: Container(
//               width: SDP.sdp(90),
//               height: SDP.sdp(50),
//               decoration: BoxDecoration(
//
//                   shape: BoxShape.rectangle,
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(SDP.sdp(50)),
//                     // bottomRight: Radius.circular(SDP.sdp(40))
//                   )),
//             ),
//           ),
//         ),
//         // Align(
//         //   alignment: Alignment.bottomCenter,
//         //   child: Padding(
//         //     padding: const EdgeInsets.symmetric(horizontal: 16),
//         //     child: Container(
//         //         width: double.infinity,
//         //         height: height / 2,
//         //         decoration: BoxDecoration(
//         //             color: AppColors.whiteFF,
//         //             borderRadius: const BorderRadius.only(
//         //                 topLeft: Radius.circular(40),
//         //                 topRight: Radius.circular(40)))),
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
//
// class CustomBackButton extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     return Padding(
//       padding:  EdgeInsets.only(bottom: SDP.sdp(SizeClass.before_padding_30)),
//       child: Container(
//           height: SDP.sdp(SizeClass.button_60),
//           alignment: Alignment.centerLeft,
//           child: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               height: SDP.sdp(SizeClass.button_60),
//               width: SDP.sdp(SizeClass.button_110),
//               decoration: BoxDecoration(
//                   color: AppColors.whiteFF,
//                   borderRadius:  BorderRadius.only(
//                       bottomRight: Radius.circular(SDP.sdp(SizeClass.before_rad_50)),
//                       topRight: Radius.circular(SDP.sdp(SizeClass.before_rad_50))
//                   )
//               ),
//               child: Row(
//                 children: [
//                   sW4(),
//                   Icon(Icons.arrow_back, color: AppColors.gray70,size: SDP.sdp(SizeClass.before_icon_30),),
//                   sW15(),
//                   t14_gy70("戻る"),
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }
//
// class CustomNext extends StatelessWidget {
//   final Color color;
//   final String title;
//   final bool isProcessing;
//
//   CustomNext(this.color,{ this.title="NEXT", this.isProcessing = false });
//
//   @override
//   Widget build(BuildContext context) {
//     SDP.init(context);
//     return Padding(
//       padding:  EdgeInsets.only(bottom: SDP.sdp(SizeClass.before_padding_30)),
//       child:  Container(
//         height: SDP.sdp(SizeClass.button_60),
//         width: SDP.sdp(SizeClass.button_110),
//         decoration: BoxDecoration(
//             color: isProcessing ? AppColors.grayE4 : AppColors.whiteFF,
//             borderRadius:  BorderRadius.only(
//                 bottomLeft: Radius.circular(SDP.sdp(SizeClass.before_rad_50)),
//                 topLeft: Radius.circular(SDP.sdp(SizeClass.before_rad_50))
//             )
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CommonText(isProcessing ? "処理中" : title, size: SDP.sdp(14),color: color),
//             sW15(),
//             Icon(Icons.arrow_forward, color: color,size: SDP.sdp(SizeClass.before_icon_30),)
//             ,sW4(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// _clearAllData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.clear();
// }
//
// showWrongCred(context, {String title = "認証エラー", String message= "メールアドレスは正しくありません"}) {
//   showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         backgroundColor: AppColors.whiteFF,
//         title: t24_b_red(title),
//         content: t18_b(message),
//         actions: [
//           TextButton(
//               onPressed:() => Navigator.pop(context),
//               child: t18_b_blDD("OK")
//           )
//         ],
//       )
//   );
// }
//
// showWarning(BuildContext context) async => showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("アプリを終了しますか？"),
//       actions: [
//         ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(AppColors.red)
//             ),
//             onPressed: () {
//               SystemNavigator.pop();
//             },
//             child: Text("はい")
//         ),
//         ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("いいえ")
//         ),
//       ],
//     )
// );