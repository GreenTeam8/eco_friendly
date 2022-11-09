import 'package:flutter/material.dart';

class dotsBuilder extends StatelessWidget {

  int? listIndex;
  int? currentIndex;
  dotsBuilder({this.listIndex,this.currentIndex, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == listIndex ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.greenAccent
      ),
    );
  }
}