import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../MyHomePage.dart';
import '../responsive/dimensions.dart';
import '../routes/page_routes.dart';

class Length extends StatefulWidget {
  const Length({super.key});

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {
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
            text: 'Length',
            style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.updateDimensions(context, 'w', 20)),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(
            Dimensions.updateDimensions(context, 'h', 10),
            Dimensions.updateDimensions(context, 'h', 40),
            Dimensions.updateDimensions(context, 'w', 10),
            Dimensions.updateDimensions(context, 'h', 10)),
        child: Column(
          children: [
            buildRow(context),
            SizedBox(
              height: Dimensions.updateDimensions(context, 'h', 25),
            ),
            buildRow(context),

          ],
        ),
      ),
    );
  }

  Row buildRow(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _openPickerWithCustomPickerTextStyle(context);
                },
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'km'
                                .toString(),
                            style: GoogleFonts.ubuntu(
                                fontSize: Dimensions.updateDimensions(
                                    context, 'w', 15),
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                      size: Dimensions.updateDimensions(context, 'w', 15),
                    ),
                  ],
                ),
              ),
              Column(

                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(
                          text: '1'
                              .toString(),
                          style: GoogleFonts.ubuntu(
                              fontSize: Dimensions.updateDimensions(
                                  context, 'w', 25),
                              fontWeight: FontWeight.w300,
                              color: Colors.white))),
                  SizedBox(
                    height: Dimensions.updateDimensions(context, 'h', 5),
                  ),

                  RichText(
                      text: TextSpan(
                          text: 'Kilometer'
                              .toString(),
                          style: GoogleFonts.ubuntu(
                              fontSize: Dimensions.updateDimensions(
                                  context, 'w', 10),
                              fontWeight: FontWeight.w100,
                              color: Colors.white70))),
                ],
              )
            ],
          );
  }
}

void _openPickerWithCustomPickerTextStyle(BuildContext context) {
  BottomPicker(
    items: [
      Text('Leonardo DiCaprio'),
      Text('Johnny Depp'),
      Text('Robert De Niro'),
      Text('Tom Hardy'),
      Text('Ben Affleck'),
    ],
    title: 'Select the actor',
    pickerTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    closeIconColor: Colors.red,
  ).show(context);
}
