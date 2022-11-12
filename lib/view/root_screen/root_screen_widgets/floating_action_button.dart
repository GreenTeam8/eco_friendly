import 'package:flutter/material.dart';

class FloatingActButton extends StatelessWidget {
  const FloatingActButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: (){},
      child: const Icon(Icons.play_arrow, size: 35,),
    );
  }
}