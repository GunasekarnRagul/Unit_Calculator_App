import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:unit_converter/responsive/dimensions.dart';

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
        title: Text('Unit Converter',
            style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.updateDimensions(context, 'w', 20))),
        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(Dimensions.updateDimensions(
              context, 'h', 1.0)), // Set the height of the white line
          child: Container(
            color: Colors.white,
            height: Dimensions.updateDimensions(context, 'h', 0.5),
          ),
        ),
      ),
      body:  const Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [

              icons( icon: Icons.cake, text: 'AGE',),


            ],
          ),
        ),
      ),
    );
  }
}

class icons extends StatelessWidget {
  final IconData icon ;
  final String text;
  const icons({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(icon,color: Colors.grey,
        size: Dimensions.updateDimensions(context, 'w', 35),),
        SizedBox(
          height: Dimensions.updateDimensions(context, 'h', 5),
        ),
        Text(text,style: TextStyle(
          fontSize: Dimensions.updateDimensions(context, 'w', 15,
          ),
          letterSpacing: 1,
          color: Colors.white,

        ),)
      ],
    );
  }
}
