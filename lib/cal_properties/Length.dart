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
  Map<String, String> lenghtval = {
    '0': 'KiloMeter KM',
    '1': 'Decimeter DM',
    '2': 'Centimeter CM',
    '3': 'Millimeter MM',
    '4': 'Micrometer µm',
    '5': 'Pico-meter PM',
    '6': 'Nautical Mile NMI',
    '7': 'Mile MI',
    '8': 'Furlong FUR',
  };

  Map<String, String> lenghtvalUnit = {
    '0': 'KM',
    '1': 'DM',
    '2': 'CM',
    '3': 'MM',
    '4': 'µm',
    '5': 'PM',
    '6': 'NMI',
    '7': 'MI',
    '8': 'FUR',
  };

  Map<String, String> lenghtvalText = {
    '0': 'KiloMeter',
    '1': 'Decimeter',
    '2': 'Centimeter',
    '3': 'Millimeter',
    '4': 'Micrometer',
    '5': 'Pico-meter',
    '6': 'Nautical Mile',
    '7': 'Mile',
    '8': 'Furlong',
  };

  late String lengthUnitUp = 'KM';
  late String lengthUnitDowm = 'CM';

  late String lengthUnitUpText = 'KiloMeter';
  late String lengthUnitDowmText = 'CentiMeter';

  late Color lengthUpTextColor = Colors.deepOrange;
  late Color lengthDownTextColor = Colors.white;

  late String upText = 'up';

  late String calUpText = '0';
  late String calDownText = '0';

  String getKeyByValue(Map<String, String> map, String value) {
    return map.entries
        .firstWhere((entry) => entry.value == value,
            orElse: () => const MapEntry('', ''))
        .key;
  }

  double convertLength(
      double initialValue, String initialUnit, String targetUnit) {
    Map<String, double> conversionFactors = {
      '0': 1000.0, // 1 Kilometer = 1000 Meters
      '1': 100.0, // 1 Decimeter = 0.1 Meters
      '2': 1.0, // 1 Centimeter = 0.01 Meters
      '3': 0.001, // 1 Millimeter = 0.001 Meters
      '4': 0.000001, // 1 Micrometer = 0.000001 Meters
      '5': 1.0e-12, // 1 Pico-meter = 1.0e-12 Meters
      '6': 1852.0, // 1 Nautical Mile = 1852 Meters
      '7': 1609.34, // 1 Mile = 1609.34 Meters
      '8': 201.168 // 1 Furlong = 201.168 Meters
    };

    double initialValueInMeters =
        initialValue / conversionFactors[initialUnit]!;
    double result = initialValueInMeters * conversionFactors[targetUnit]!;
    return result;
  }

  void _openPickerWithCustomPickerTextStyle(
      BuildContext context, String place) {
    BottomPicker(
      backgroundColor: Colors.black,
      buttonSingleColor: Colors.white,
      iconColor: Colors.black,
      items: [
        Text(lenghtval['0']!),
        Text(lenghtval['1']!),
        Text(lenghtval['2']!),
        Text(lenghtval['3']!),
        Text(lenghtval['4']!),
        Text(lenghtval['5']!),
        Text(lenghtval['6']!),
        Text(lenghtval['7']!),
        Text(lenghtval['8']!),
      ],
      title: 'Select Unit',
      pickerTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      onChange: (index) {
        // print(index);

        setState(() {
          if (place == 'up') {
            lengthUnitUp = lenghtvalUnit[index.toString()]!;
            lengthUnitUpText = lenghtvalText[index.toString()]!;
          } else if (place == 'down') {
            lengthUnitDowm = lenghtvalUnit[index.toString()]!;
            lengthUnitDowmText = lenghtvalText[index.toString()]!;
          }
        });

        _calculateLength();
      },
      onSubmit: (index) {
        setState(() {
          if (place == 'up') {
            lengthUnitUp = lenghtvalUnit[index.toString()]!;
            lengthUnitUpText = lenghtvalText[index.toString()]!;
          } else if (place == 'down') {
            lengthUnitDowm = lenghtvalUnit[index.toString()]!;
            lengthUnitDowmText = lenghtvalText[index.toString()]!;
          }
        });

        _calculateLength();
      },
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
                        buildRow(context, 'up'),
                        SizedBox(
                          height: Dimensions.updateDimensions(context, 'h', 25),
                        ),
                        buildRow(context, 'down'),
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
                                buildTextButton(context, '7'),
                                buildTextButton(context, '8'),
                                buildTextButton(context, '9'),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '4'),
                                buildTextButton(context, '5'),
                                buildTextButton(context, '6'),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, '1'),
                                buildTextButton(context, '2'),
                                buildTextButton(context, '3'),
                              ],
                            ),
                            SizedBox(
                              height:
                                  Dimensions.updateDimensions(context, 'h', 25),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildTextButton(context, ''),
                                buildTextButton(context, '0'),
                                buildTextButton(context, '.'),
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
                              onPressed: () => _allClearText(),
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
                                onPressed: () => _removeLastText(),
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
                                child: const Icon(
                                  Icons.cancel_presentation_outlined,
                                  color: Colors.deepOrange,
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

  Opacity buildTextButton(BuildContext context, String text) {
    return Opacity(
      opacity: (text.isNotEmpty) ? 1.0 : 0.0,
      child: TextButton(
        onPressed: () => _btnClicked(text),
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

  Row buildRow(BuildContext context, String place) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            _openPickerWithCustomPickerTextStyle(context, place);
          },
          child: Row(
            children: [
              RichText(
                  text: TextSpan(
                      text: (place == 'up') ? lengthUnitUp : lengthUnitDowm,
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
        GestureDetector(
          onTap: () {
            _textColorChange(place);
            (place == 'up') ? upText = 'up' : upText = 'down';
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                  text: TextSpan(
                      text: (place == 'up') ? calUpText : calDownText,
                      style: GoogleFonts.ubuntu(
                          fontSize:
                              Dimensions.updateDimensions(context, 'w', 25),
                          fontWeight: FontWeight.w300,
                          color: (place == 'up')
                              ? lengthUpTextColor
                              : lengthDownTextColor))),
              SizedBox(
                height: Dimensions.updateDimensions(context, 'h', 5),
              ),
              RichText(
                  text: TextSpan(
                      text: (place == 'up')
                          ? lengthUnitUpText
                          : lengthUnitDowmText,
                      style: GoogleFonts.ubuntu(
                          fontSize:
                              Dimensions.updateDimensions(context, 'w', 10),
                          fontWeight: FontWeight.w100,
                          color: Colors.white70))),
            ],
          ),
        )
      ],
    );
  }

  void _textColorChange(String place) {
    setState(() {
      if (place == 'up') {
        lengthUpTextColor = Colors.deepOrange;
        lengthDownTextColor = Colors.white;
      } else if (place == 'down') {
        lengthDownTextColor = Colors.deepOrange;
        lengthUpTextColor = Colors.white;
      }
    });
  }

  _btnClicked(String text) {
    if (lengthUpTextColor == Colors.deepOrange) {
      (calUpText.isNotEmpty) ? calUpText = '0' : calUpText = '';
    } else if (lengthDownTextColor == Colors.deepOrange) {
      (calDownText.isNotEmpty) ? calDownText = '0' : calDownText = '';
    }
    setState(() {
      calUpText == '0' && upText == 'up' ? calUpText = '' : null;
      calDownText == '0' && upText == 'down' ? calDownText = "" : null;
      if (upText == 'up') {
        calUpText += text;
      } else if (upText == 'down') {
        calDownText += text;
      }
    });

    _calculateLength();
  }

  _allClearText() {
    setState(() {
      calUpText = '0';
      calDownText = '0';
    });
  }

  _removeLastText() {
    setState(() {
      if (upText == 'up' && calUpText.length > 1) {
        calUpText = calUpText.substring(0, calUpText.length - 1);
      } else if (upText == 'down' && calDownText.length > 1) {
        calDownText = calDownText.substring(0, calDownText.length - 1);
      } else if (upText == 'up' && calUpText.length == 1) {
        calUpText = '0'; // Set to '0' when the length is 1
      } else if (upText == 'down' && calDownText.length == 1) {
        calDownText = '0'; // Set to '0' when the length is 1
      }
    });

    _calculateLength();
  }

  void _calculateLength() {
    String upKey = getKeyByValue(lenghtvalUnit, lengthUnitUp);
    String downKey = getKeyByValue(lenghtvalUnit, lengthUnitDowm);

    if (upText == 'up') {
      double result = convertLength(double.parse(calUpText), downKey, upKey);

      setState(() {
        calDownText = _formatNumber(result);
      });
    } else if (upText == 'down') {
      setState(() {
        double result =
            convertLength(double.parse(calDownText), upKey, downKey);
        calUpText = _formatNumber(result);
      });
    }
  }

  String _formatNumber(double number) {
    NumberFormat formatter = NumberFormat('#,##0.000', 'en_US');
    return formatter.format(number);
  }
}
