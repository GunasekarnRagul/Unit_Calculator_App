import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit_converter/MyHomePage.dart';
import 'package:unit_converter/routes/page_routes.dart';

import '../responsive/dimensions.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: 'Date Of Birth',
      buttonSingleColor: Colors.white,
      iconColor:Colors.black,
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: DateTime(2002, 03, 02),
      maxDateTime: DateTime(3000),
      minDateTime: DateTime(1950),
      pickerTextStyle:  TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.updateDimensions(context, 'w', 13),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      titleStyle:  TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: Dimensions.updateDimensions(context, 'w', 20),
        color: Colors.white,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      onChange: (index) {
        // print(index);
      },
      onSubmit: (index) {

      },
      bottomPickerTheme: BottomPickerTheme.plumPlate,
    ).show(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     appBar: AppBar(
       backgroundColor: Colors.black,
       centerTitle: true,
       leading: IconButton(
         onPressed: ()
         {
           // Navigator.pushReplacement(context, RouteGenerator.createRouteBack(const MyHomePage()));
           Navigator.push(context, RouteGenerator.createRoute(const MyHomePage()));
         }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,),
       ),
       title:  RichText(
         text: TextSpan(
           text: 'AGE',
           style: GoogleFonts.ubuntu(
               color: Colors.white,
               fontWeight: FontWeight.w300,
               fontSize: Dimensions.updateDimensions(context, 'w', 20)),
         ),
       ),
     ),
body: ElevatedButton(
  onPressed: () => _openDatePicker(context), child: Text('date'),
  
),
    );
  }
}
