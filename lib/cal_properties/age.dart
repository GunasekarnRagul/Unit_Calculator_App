import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:unit_converter/MyHomePage.dart';
import 'package:unit_converter/routes/page_routes.dart';

import '../responsive/dimensions.dart';

class Age extends StatefulWidget {
  Age({super.key});
  late DateTime customDate = DateTime(2000, 3, 2);
  late DateTime todayDate = DateTime.now();

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  void _openDatePicker(BuildContext context, String tittleText) {
    DateTime initialDate;

    if (tittleText == 'Date Of Birth') {
      initialDate = DateTime(2000, 03, 02);
    } else if (tittleText == 'Today') {
      initialDate = DateTime.now();
    } else {
      initialDate = DateTime.now(); // Default to current date if not recognized
    }
    // print(DateFormat('dd-MMM-yyyy').format(initialDate));

    BottomPicker.date(
      title: tittleText,
      buttonSingleColor: Colors.white,
      iconColor: Colors.black,
      dateOrder: DatePickerDateOrder.dmy,
      initialDateTime: initialDate,
      maxDateTime: DateTime(3000),
      minDateTime: DateTime(1950),
      pickerTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.updateDimensions(context, 'w', 13),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.w100,
        fontSize: Dimensions.updateDimensions(context, 'w', 20),
        color: Colors.white,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      onChange: (index) {
        setState(() {
          (tittleText == 'Date Of Birth')
              ? widget.customDate = index
              : widget.todayDate = index;
        });
      },
      onSubmit: (index) {
        (tittleText == 'Date Of Birth')
            ? widget.customDate = index
            : widget.todayDate = index;
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
          onPressed: () {
            // Navigator.pushReplacement(context, RouteGenerator.createRouteBack(const MyHomePage()));
            Navigator.push(
                context, RouteGenerator.createRoute(const MyHomePage()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'AGE',
            style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.updateDimensions(context, 'w', 20)),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            Dimensions.updateDimensions(context, 'h', 30),
            Dimensions.updateDimensions(context, 'h', 40),
            Dimensions.updateDimensions(context, 'w', 30),
            Dimensions.updateDimensions(context, 'h', 10)),
        child: Column(
          children: [
            buildRow(context,
                tittleText: 'Date Of Birth', dateText: widget.customDate),
            SizedBox(
              height: Dimensions.updateDimensions(context, 'h', 40),
            ),
            buildRow(context, tittleText: 'Today', dateText: widget.todayDate),
          ],
        ),
      ),
    );
  }

  Row buildRow(BuildContext context,
      {required String tittleText, required DateTime dateText}) {
    // String? tittleText;
    // String? dateText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: TextSpan(
                text: tittleText,
                style: GoogleFonts.ubuntu(
                    fontSize: Dimensions.updateDimensions(context, 'w', 15),
                    fontWeight: FontWeight.w100,
                    color: Colors.white))),
        GestureDetector(
          onTap: () {
            _openDatePicker(context, tittleText);
          },
          child: Row(
            children: [
              RichText(
                  text: TextSpan(
                      text:
                          DateFormat('dd-MMM-yyyy').format(dateText).toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize:
                              Dimensions.updateDimensions(context, 'w', 15),
                          fontWeight: FontWeight.w100,
                          color: Colors.white))),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
                size: Dimensions.updateDimensions(context, 'w', 15),
              )
            ],
          ),
        ),
      ],
    );
  }
}
