import 'package:bottom_picker/bottom_picker.dart';
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
  void _openPickerWithCustomPickerTextStyle(BuildContext context) {
    BottomPicker(
      backgroundColor: Colors.black,
      buttonSingleColor: Colors.white,
      iconColor: Colors.black,
      items: const [
        Text('Leonardo DiCaprio'),
        Text('Johnny Depp'),
        Text('Robert De Niro'),
        Text('Tom Hardy'),
        Text('Ben Affleck'),
      ],
      title: 'Select Unit',
      pickerTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      closeIconColor: Colors.white,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
        body: Stack(
          children: [
            Positioned(
              bottom: 0, // Align to the bottom of the stack
              left: 0, // Align to the left of the stack
              right: 0,
              child: Column(
                children: [
                  Container(
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
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 50),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.grey, // Set the color of the line
                        ),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 20),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.70,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '7', () => {}),
                                buildTextButton(context, '8', () => {}),
                                buildTextButton(context, '9', () => {}),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '4', () => {}),
                                buildTextButton(context, '5', () => {}),
                                buildTextButton(context, '6', () => {}),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '1', () => {}),
                                buildTextButton(context, '2', () => {}),
                                buildTextButton(context, '3', () => {}),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '', () => {}),
                                buildTextButton(context, '0', () => {}),
                                buildTextButton(context, '.', () => {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.19,
                        // color: Colors.green,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.white10, // Text color
                                minimumSize: Size(
                                  Dimensions.updateDimensions(
                                      context, 'w', 70), // Set width
                                  Dimensions.updateDimensions(
                                      context, 'h', 130), // Set height
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 1.0,
                                    vertical: 0.0), // Adjust padding
                              ),
                              child: RichText(
                                text: TextSpan(
                                  text: 'AC',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.w300,
                                      fontSize: Dimensions.updateDimensions(
                                          context, 'w', 20)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 20),
                            ),
                            TextButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.white10, // Text color
                                  minimumSize: Size(
                                    Dimensions.updateDimensions(
                                        context, 'w', 70), // Set width
                                    Dimensions.updateDimensions(
                                        context, 'h', 130), // Set height
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0,
                                      vertical: 0.0), // Adjust padding
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.cancel_presentation_outlined,
                                    color: Colors.deepOrange,
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Opacity buildTextButton(
      BuildContext context, String text, Function function) {
    return Opacity(
      opacity: (text.isNotEmpty) ? 1.0 : 0.0,
      child: TextButton(
        onPressed: function as void Function(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent, // Text color
          minimumSize: Size(
            Dimensions.updateDimensions(context, 'w', 70), // Set width
            Dimensions.updateDimensions(context, 'h', 70), // Set height
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 8.0), // Adjust padding
        ),
        child: RichText(
          text: TextSpan(
            text: text,
            style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.updateDimensions(context, 'w', 30)),
          ),
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
                      text: 'km'.toString(),
                      style: GoogleFonts.ubuntu(
                          fontSize:
                              Dimensions.updateDimensions(context, 'w', 15),
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
                    text: '1'.toString(),
                    style: GoogleFonts.ubuntu(
                        fontSize: Dimensions.updateDimensions(context, 'w', 25),
                        fontWeight: FontWeight.w300,
                        color: Colors.white))),
            SizedBox(
              height: Dimensions.updateDimensions(context, 'h', 5),
            ),
            RichText(
                text: TextSpan(
                    text: 'Kilometer'.toString(),
                    style: GoogleFonts.ubuntu(
                        fontSize: Dimensions.updateDimensions(context, 'w', 10),
                        fontWeight: FontWeight.w100,
                        color: Colors.white70))),
          ],
        )
      ],
    );
  }
}
