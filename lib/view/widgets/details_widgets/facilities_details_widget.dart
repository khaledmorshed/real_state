import 'package:flutter/cupertino.dart';
import 'package:real_state/utills/global/text.dart';
import 'package:real_state/utills/sdp.dart';

class FacilitiesDetailsWidget extends StatelessWidget {
  const FacilitiesDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        txt16("Facility", fontWeight: FontWeight.w500),
        Container(
          child: Wrap(
            //TODO
            children: [],
          ),
        ),
      ],
    );
  }
}
