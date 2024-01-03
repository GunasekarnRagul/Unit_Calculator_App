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

  dynamic years;
  dynamic months;
  dynamic days;

  dynamic nextWeek;
  dynamic nextMonth;
  dynamic nextDays;

  dynamic summaryYear;
  dynamic summaryMonths;
  dynamic summaryWeeks;
  dynamic summaryDays;
  dynamic summaryHours;
  dynamic summaryMinutes;

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  @override
  void initState() {
    super.initState();
    calculateAgeDifference();
    nextBirthday();
    calSummary();
  }

  calculateAgeDifference() {
    Duration difference = widget.todayDate.difference(widget.customDate);
    setState(() {
      widget.years = (difference.inDays / 365).floor().toString();
      widget.months = ((difference.inDays % 365) / 30).floor().toString();
      widget.days = (((difference.inDays % 365) % 30) % 7).toString();
    });
  }

  nextBirthday() {
    DateTime nextBirthday = DateTime(
        widget.todayDate.year, widget.customDate.month, widget.customDate.day);
    if (nextBirthday.isBefore(widget.todayDate)) {
      nextBirthday = DateTime(widget.todayDate.year + 1,
          widget.customDate.month, widget.customDate.day);
    }

    Duration difference = nextBirthday.difference(widget.todayDate);

    setState(() {
      widget.nextMonth = (difference.inDays / 30).floor();
      widget.nextDays = difference.inDays % 30;
      widget.nextWeek = DateFormat('EEEE').format(nextBirthday);
    });
  }

  calSummary() {
    Duration difference = widget.todayDate.difference(widget.customDate);

    int years = (difference.inDays / 365).floor();
    int remainingDays = difference.inDays % 365;
    int months = (remainingDays / 30).floor();
    int weeks = (difference.inDays / 7).floor(); // Corrected line
    int days = remainingDays % 7;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;

    setState(() {
      widget.summaryYear = years.toString();
      widget.summaryMonths = (years * 12 + months).toString();
      widget.summaryWeeks = weeks.toString();
      widget.summaryDays =( years * 365 + remainingDays).toString();
      widget.summaryHours = difference.inHours.toString();
      widget.summaryMinutes = difference.inMinutes.toString();
    });

    // print("Years: $years");
    // print("Months: ${years * 12 + months}");
    // print("Weeks: $weeks");
    // print("Days: ${years * 365 + remainingDays}");
    // print("Hours: ${difference.inHours}");
    // print("Minutes: ${difference.inMinutes}");
  }

  Future<void> _openDatePicker(BuildContext context, String tittleText) async {
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
      titlePadding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
        calculateAgeDifference();
        nextBirthday();
        calSummary();
        setState(() {
          (tittleText == 'Date Of Birth')
              ? widget.customDate = index
              : widget.todayDate = index;
        });
      },
      onSubmit: (index) {
        calculateAgeDifference();
        nextBirthday();
        calSummary();
        setState(() {
          (tittleText == 'Date Of Birth')
              ? widget.customDate = index
              : widget.todayDate = index;
        });
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
      body: SingleChildScrollView(
        child: Container(
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
              buildRow(context,
                  tittleText: 'Today', dateText: widget.todayDate),
              SizedBox(
                height: Dimensions.updateDimensions(context, 'h', 60),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                width: double.infinity,
                height: Dimensions.updateDimensions(context, 'h', 180),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'AGE',
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 23)),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 15),
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: widget.years,
                                style: GoogleFonts.openSans(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -2,
                                    fontSize: Dimensions.updateDimensions(
                                        context, 'w', 35)),
                              ),
                            ),
                            SizedBox(
                              width:
                                  Dimensions.updateDimensions(context, 'w', 10),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Years',
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: Dimensions.updateDimensions(
                                        context, 'w', 15)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 10),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '${widget.months} Months | ${widget.days} Days',
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 10)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: double.infinity,
                      width: 0.5,
                      color: Colors.grey, // Set the color of the line
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Next Birthday',
                            style: GoogleFonts.openSans(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 15)),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 15),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.deepOrange,
                          ),
                          child: Icon(
                            Icons.cake_outlined,
                            color: Colors.white,
                            size: Dimensions.updateDimensions(context, 'w', 20),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 15),
                        ),
                        RichText(
                          text: TextSpan(
                            text: widget.nextWeek,
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 15)),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 15),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '${widget.nextMonth} Months | ${widget.nextDays} Days',
                            style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 10)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
                width: double.infinity,
                height: Dimensions.updateDimensions(context, 'h', 200),
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey, // Set the color of the line
                    ),
                    SizedBox(
                      height: Dimensions.updateDimensions(context, 'h', 20),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'SUMMARY',
                        style: GoogleFonts.openSans(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            fontSize:
                                Dimensions.updateDimensions(context, 'w', 15)),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.updateDimensions(context, 'h', 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        summary(context, 'Years', widget.summaryYear, 20),
                        summary(context, 'Months', widget.summaryMonths, 20),
                        summary(context, 'Weeks', widget.summaryWeeks, 20),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.updateDimensions(context, 'h', 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        summary(context, 'Days', widget.summaryDays, 10),
                        summary(context, 'Hours',widget.summaryHours, 10),
                        summary(context, 'Minutes', widget.summaryMinutes, 10),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column summary(
      BuildContext context, String head, String value, double textVal) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: head,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                letterSpacing: 1,
                fontSize: Dimensions.updateDimensions(context, 'w', 12)),
          ),
        ),
        SizedBox(
          height: Dimensions.updateDimensions(context, 'h', 5),
        ),
        RichText(
          text: TextSpan(
            text: value,
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                fontSize: Dimensions.updateDimensions(context, 'w', textVal)),
          ),
        ),
      ],
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
