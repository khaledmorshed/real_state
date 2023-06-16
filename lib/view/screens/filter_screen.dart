import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:provider/provider.dart';

import '../../providers/a_specific_widget_provider.dart';
import '../../utills/conts/color_manager.dart';
import '../../utills/global/size_box.dart';
import '../../utills/global/text.dart';
import '../../utills/sdp.dart';
import '../widgets/custom_button.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _buttonList = ["All", "House", "Apartment", "Flat", "Hotel",];
  var _numberButtonList = ["All", "1", "2", "3", "4+",];
  int _selectedPropertyButtonIndex = 0;
  int _selectedBedRoomButtonIndex = 0;
  int _selectedBathRoomButtonIndex = 0;
  String _selectedValueForCity = "Select City";
  String _selectedValueForArea = "Select Area";
  String _selectedValueForMinimum = "Minimum";
  String _selectedValueForMaximum = "Maximum";

  int _indexCheckForCity = 0;
  int _indexCheckForArea = 0;
  int _indexCheckForMinimum = 0;
  int _indexCheckForMaximum = 0;



  List<String> _dropdownOptionsForCity = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];
  List<String> _dropdownOptionsForArea = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  List<String> _dropdownOptionsForMinimum = [
    '800',
    '900',
    '1000',
    '1100',
  ];

  List<String> _dropdownOptionsForMaximum = [
    '2000',
    '2500',
    '3000',
    '3500',
  ];

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

        title: txt18("filter", fontWeight: FontWeight.w500),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: (){},
                icon: Image.asset("assets/vectors/filter_screen/refresh.png")),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          //padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              _allCategoriesButton(),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              szH15(),
              _locationMethod(),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              szH15(),
              _bedRoomMethod(),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              szH15(),
              _bathRoomMethod(),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              szH15(),
              _areaMethod(),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              Consumer<ASpecificWidgetProvider>(
                  builder: (BuildContext context, _provider, _){
                    return _priceRangeSlider(_provider);
                  }),
              szH15(),
              Image.asset("assets/vectors/filter_screen/1.png"),
              szH30(),
              ElevatedButton(
                child: Text("Search", style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(
                  // padding: EdgeInsets.only(top: 10.5, bottom: 10.5, left: 100, right: 100),
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: ColorManager.buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
                onPressed: () {
                  //_formValidationAndSave();
                },
              ),
              szH30(),
            ],
          ),
        ),
      ),
    );
  }

  _allCategoriesButton(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: Image.asset("assets/vectors/filter_screen/property.png", ),
            ),
            szW10(),
            txt18("Property Type", fontWeight: FontWeight.w500),
          ],
        ),
        szH15(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: _buttonList.map((e){
              int index = _buttonList.indexOf(e);
              return  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      e,
                      // isSelected: index == _selectedButtonIndex,
                      isSelected: index == _selectedPropertyButtonIndex,
                      onTap: (){
                        setState(() {
                          _selectedPropertyButtonIndex = index;
                        });

                      },

                    ),
                  ),
                  szW10(),
                ],
              );
            }).toList(),
          ),
        ),

      ],
    );
  }

  _locationMethod(){
    print("locationmethod........................");
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Image.asset("assets/vectors/filter_screen/location.png", ),
            ),
            szW10(),
            txt16("Property Location", fontWeight: FontWeight.w500)
          ],
        ),
        szH15(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
/*            Expanded(
              child: Container(
                color: Colors.white,

                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButtonFormField(
                      isExpanded: true,
                      icon:  Container(

                        decoration: BoxDecoration(
                          color: ColorManager.floatingButton,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: IconButton(
                          color: Colors.red,
                          onPressed: (){
                            print("dfdlf...........10");
                            _showDropDwon();
                          },
                          icon: Image.asset("assets/vectors/filter_screen/dropdwon.png",),
                        ),
                      ),
                      items: null,
                      // value: selectedValue,
                      hint: Container(
                         color: Colors.red,
                          //width: double.infinity,
                          child: Text("$selectedValue", textAlign: TextAlign.center,)),
                      onChanged: (value){
                        //_showDropDwon();
                        setState(() {
                          print("onchanged..............");
                          selectedValue;
                        });
                      },
                      onTap:(){
                        print("dfdlf...........");
                        _showDropDwon();
                      },

                    // decoration: InputDecoration(
                    //   filled: true,
                    //    fillColor: Colors.white, // Set the button background color
                    //
                    //   // enabledBorder: OutlineInputBorder(
                    //   //   //borderSide: BorderSide(color: Colors.blue),
                    //   //   borderSide: BorderSide.none,
                    //   //   // borderRadius: BorderRadius.circular(10),
                    //   //   borderRadius: BorderRadius.only(
                    //   //     topRight: Radius.circular(10),
                    //   //     bottomRight: Radius.circular(10),
                    //   //   ),
                    //   //
                    //   // ),
                    //   // focusedBorder: OutlineInputBorder(
                    //   //   borderSide: BorderSide.none,
                    //   //   borderRadius: BorderRadius.only(
                    //   //     topRight: Radius.circular(10),
                    //   //     bottomRight: Radius.circular(10),
                    //   //   ),
                    //   // ),
                    // ),

                  ),
                ),
              ),
            ),
            */
            Expanded(
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    //dropdownColor: Colors.red,
                      isExpanded: true,
                      underline: Container(
                        height: 0, // Set the height of the underline
                        color: Colors.white, // Set the color of the underline
                      ),
                      icon:  Container(
                        decoration: BoxDecoration(
                          color: ColorManager.floatingButton,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: IconButton(
                          onPressed: (){
                            print("dfdlf...........10");
                            _showDropDwonForCity();
                          },
                          icon: Image.asset("assets/vectors/filter_screen/dropdwon.png",),
                        ),
                      ),
                      items: null,
                      // value: selectedValue,
                      hint: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("$_selectedValueForCity",),
                          )),
                      onChanged: (value){
                        //_showDropDwon();
                        setState(() {
                          print("onchanged..............");
                          _selectedValueForCity;
                        });
                      },
                      onTap:(){
                        print("dfdlf...........");
                        _showDropDwonForCity();
                      }

                  ),
                ),
              ),
            ),
            szW15(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    //dropdownColor: Colors.red,
                      isExpanded: true,
                    underline: Container(
                      height: 0, // Set the height of the underline
                      color: Colors.white, // Set the color of the underline
                    ),
                      icon:  Container(
                        decoration: BoxDecoration(
                          color: ColorManager.floatingButton,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: IconButton(
                          onPressed: (){
                            print("dfdlf...........10");
                            _showDropDwonForArea();
                          },
                          icon: Image.asset("assets/vectors/filter_screen/dropdwon.png",),
                        ),
                      ),
                      items: null,
                      // value: selectedValue,
                      hint: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("$_selectedValueForArea",),
                          )),
                      onChanged: (value){
                        //_showDropDwon();
                        setState(() {
                          print("onchanged..............");
                          _selectedValueForArea;
                        });
                      },
                      onTap:(){
                        print("dfdlf...........");
                        _showDropDwonForArea();
                      },

                  ),
                ),
              ),
            ),


          ],
        ),


      ],
    );
  }

  _showDropDwonForCity(){
    return  showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: txt16("Select City"),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _dropdownOptionsForCity.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: index == _indexCheckForCity ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
                        title: Text(_dropdownOptionsForCity[index]),
                        onTap: () {
                          setState(() {
                            _selectedValueForCity = _dropdownOptionsForCity[index];
                            _indexCheckForCity = index;
                            print("val................${_selectedValueForCity}");
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  _showDropDwonForArea(){
    return  showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: txt16("Select Area"),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _dropdownOptionsForArea.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: index == _indexCheckForArea ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
                        title: Text(_dropdownOptionsForArea[index]),
                        onTap: () {
                          setState(() {
                            _selectedValueForArea = _dropdownOptionsForArea[index];
                            _indexCheckForArea = index;
                            print("val................${_selectedValueForArea}");
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _bedRoomMethod(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child: Image.asset("assets/vectors/filter_screen/bed.png", ),
            ),
            szW10(),
            txt16("Bedroom", fontWeight: FontWeight.w500)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: _numberButtonList.map((e){
              int index = _numberButtonList.indexOf(e);
              return  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      e,
                      // isSelected: index == _selectedButtonIndex,
                      isSelected: index == _selectedBedRoomButtonIndex,
                      onTap: (){
                        setState(() {
                          _selectedBedRoomButtonIndex = index;
                        });

                      },

                    ),
                  ),
                  szW10(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  _bathRoomMethod(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child: Image.asset("assets/vectors/filter_screen/bath.png", ),
            ),
            szW10(),
            txt16("Bathroom", fontWeight: FontWeight.w500)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Wrap(
            alignment: WrapAlignment.start,
            children: _numberButtonList.map((e){
              int index = _numberButtonList.indexOf(e);
              return  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CustomButton(
                      e,
                      // isSelected: index == _selectedButtonIndex,
                      isSelected: index == _selectedBathRoomButtonIndex,
                      onTap: (){
                        setState(() {
                          _selectedBathRoomButtonIndex = index;
                        });

                      },

                    ),
                  ),
                  szW10(),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  _areaMethod(){
    print("locationmethod........................");
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Image.asset("assets/vectors/filter_screen/expand.png", ),
            ),
            szW10(),
            txt16("Area (sqft)", fontWeight: FontWeight.w500)
          ],
        ),
        szH15(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    //dropdownColor: Colors.red,
                      isExpanded: true,
                      underline: Container(
                        height: 0, // Set the height of the underline
                        color: Colors.white, // Set the color of the underline
                      ),
                      icon:  Container(
                        decoration: BoxDecoration(
                          color: ColorManager.floatingButton,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: IconButton(
                          onPressed: (){
                            print("dfdlf...........10");
                            _showDropDwonForMinimum();
                          },
                          icon: Image.asset("assets/vectors/filter_screen/dropdwon.png",),
                        ),
                      ),
                      items: null,
                      // value: selectedValue,
                      hint: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("$_selectedValueForMinimum",),
                          )),
                      onChanged: (value){
                        //_showDropDwon();
                        setState(() {
                          print("onchanged..............");
                          _selectedValueForMinimum;
                        });
                      },
                      onTap:(){
                        print("dfdlf...........");
                        _showDropDwonForMinimum();
                      }

                  ),
                ),
              ),
            ),
            szW15(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: DropdownButton(
                    //dropdownColor: Colors.red,
                    isExpanded: true,
                    underline: Container(
                      height: 0, // Set the height of the underline
                      color: Colors.white, // Set the color of the underline
                    ),
                    icon:  Container(
                      decoration: BoxDecoration(
                        color: ColorManager.floatingButton,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: IconButton(
                        onPressed: (){
                          print("dfdlf...........10");
                          _showDropDwonForMaximum();
                        },
                        icon: Image.asset("assets/vectors/filter_screen/dropdwon.png",),
                      ),
                    ),
                    items: null,
                    // value: selectedValue,
                    hint: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("$_selectedValueForMaximum",),
                        )),
                    onChanged: (value){
                      //_showDropDwon();
                      setState(() {
                        print("onchanged..............");
                        _selectedValueForMaximum;
                      });
                    },
                    onTap:(){
                      print("dfdlf...........");
                      _showDropDwonForMaximum();
                    },

                  ),
                ),
              ),
            ),


          ],
        ),


      ],
    );
  }

  _showDropDwonForMinimum(){
    return  showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: txt16("Select Minimum Square feet"),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _dropdownOptionsForMinimum.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: index == _indexCheckForMinimum ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
                        title: Text(_dropdownOptionsForMinimum[index]),
                        onTap: () {
                          setState(() {
                            _selectedValueForMinimum = _dropdownOptionsForMinimum[index];
                            _indexCheckForMinimum = index;
                            print("val................${_selectedValueForMinimum}");
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _showDropDwonForMaximum(){
    return  showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: txt16("Select Maximum Square feet"),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: _dropdownOptionsForMaximum.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: index == _indexCheckForMaximum ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
                        title: Text(_dropdownOptionsForMaximum[index]),
                        onTap: () {
                          setState(() {
                            _selectedValueForMaximum = _dropdownOptionsForMaximum[index];
                            _indexCheckForMaximum = index;
                            print("val................${_selectedValueForMaximum}");
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _priceRangeSlider(ASpecificWidgetProvider _provider){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child: Image.asset("assets/vectors/filter_screen/price_tag _1.png", ),
            ),
            szW10(),
            txt16("Price Range", fontWeight: FontWeight.w500)
          ],
        ),
        Container(
          //width: double.infinity,
          child: FlutterSlider(
            handler: FlutterSliderHandler(
                child: Image.asset("assets/vectors/filter_screen/Radio.png", ),
            ),
            rightHandler: FlutterSliderHandler(
                child: Image.asset("assets/vectors/filter_screen/Radio.png", ),
            ),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.inactiveSliding,
               // border: Border.all(width: 3, color: Colors.blue),
              ),
              activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: ColorManager.floatingButton
              ),
            ),
            values: [_provider.lowerValue, _provider.upperValue],
            rangeSlider: true,
            max: 50000,
            min: 0,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              _provider.setLowerAndUpperValue(lowerValue, upperValue);
            },
          ),
        )
      ],
    );
  }

}
