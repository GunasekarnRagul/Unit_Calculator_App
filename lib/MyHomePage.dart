import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit_converter/cal_properties/age.dart';
import 'package:unit_converter/cal_properties/mass.dart';
import 'package:unit_converter/cal_properties/speed.dart';
import 'package:unit_converter/cal_properties/temperature.dart';
import 'package:unit_converter/responsive/dimensions.dart';
import 'package:unit_converter/routes/page_routes.dart';

import 'cal_properties/Length.dart';
import 'cal_properties/time.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(
              left: Dimensions.updateDimensions(
                  context, 'w', 20)), // Adjust the padding as needed
          child: Icon(
            Icons.calculate_rounded,
            color: Colors.grey,
            size: Dimensions.updateDimensions(context, 'w', 45),
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'Unit Converter',
            style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: Dimensions.updateDimensions(context, 'w', 20)),
          ),
        ),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.updateDimensions(
              context, 'h', 1.0)), // Set the height of the white line
          child: Container(
            color: Colors.white,
            height: Dimensions.updateDimensions(context, 'h', 0.5),
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icons(
                      icon: FontAwesomeIcons.cakeCandles,
                      text: 'AGE',
                      function: () {
                        Navigator.pushReplacement(
                            context, RouteGenerator.createRoute(Age()));
                      }),
                  icons(icon: FontAwesomeIcons.scaleBalanced,
                      text: 'Length', function: ()
                      {
                        Navigator.pushReplacement(context, RouteGenerator.createRoute(const Length()));
                      }),

                  icons(icon: FontAwesomeIcons.weightHanging,
                      text: 'Mass', function: ()
                      {
                        Navigator.pushReplacement(context, RouteGenerator.createRoute(const Mass()));
                      }),
                ],
              ),
              SizedBox(
                height: Dimensions.updateDimensions(context, 'h', 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  icons(icon: FontAwesomeIcons.gaugeSimpleHigh,
                      text: 'Speed', function: ()
                      {
                        Navigator.pushReplacement(context, RouteGenerator.createRoute(const Speed()));
                      }),


                  icons(icon: FontAwesomeIcons.temperatureFull,
                      text: 'Temperature', function: ()
                      {
                        Navigator.pushReplacement(context, RouteGenerator.createRoute(const Temperature()));
                      }),
                  icons(icon: FontAwesomeIcons.clock,
                      text: 'Time', function: ()
                      {
                        Navigator.pushReplacement(context, RouteGenerator.createRoute(const Time()));
                      }),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}

class icons extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function function;
  const icons({
    super.key,
    required this.icon,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function as void Function(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: Colors.grey,
            size: Dimensions.updateDimensions(context, 'w', 35),
          ),
          SizedBox(
            height: Dimensions.updateDimensions(context, 'h', 5),
          ),
          RichText(
              text: TextSpan(
                  text: text,
                  style: GoogleFonts.ubuntu(
                      fontSize: Dimensions.updateDimensions(
                        context,
                        'w',
                        12,
                      ),
                      letterSpacing: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w100))),
        ],
      ),
    );
  }
}
