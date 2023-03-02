// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, avoid_web_libraries_in_flutter, unused_import, prefer_final_fields, duplicate_ignore, avoid_unnecessary_containers

// import 'dart:html';

import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/widgets/left_bar.dart';
import 'package:flutter_application_1/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexcolor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexcolor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  controller: _heightController,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexcolor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: _weightController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexcolor),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      helperStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8))),
                ),
              )
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              double _h = double.parse(_heightController.text);
              double _w = double.parse(_weightController.text);
              setState(() {
                _bmiResult = _w/(_h*_h);
                if(_bmiResult>25){
                  _textResult = "You are over weight";
                }else if(_bmiResult >=18.5 && _bmiResult<=25){
                  _textResult = "You have normal weight";
                }else{
                  _textResult = "You are under weight"; 
                }
              });
            },
            child: Container(
              child: Text("Calculate",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accentHexcolor),),
             
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: accentHexcolor),
            ),
          ),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 30,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
            child: Text(
              _textResult,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentHexcolor),
            ),
          ),),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          LeftBar(barWidth: 40),
          SizedBox(
            height: 20,
          ),
          LeftBar(barWidth: 70),
          SizedBox(
            height: 20,
          ),
          LeftBar(barWidth: 40),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 40),
          SizedBox(
            height: 20,
          ),
          RightBar(barWidth: 70),
        ],
      )),
    );
  }
}
