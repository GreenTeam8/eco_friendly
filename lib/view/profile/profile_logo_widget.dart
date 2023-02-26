
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/main.dart';
import 'package:flutter/material.dart';

class ProfileLogoWidget extends StatelessWidget {
  const ProfileLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/ecoIcon.png')),
        Text('Join our family!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: mainColor),),
        RichText(
          text: TextSpan(
            text: 'Our planet Earth needs a Heroes.',
            style: Theme.of(context).textTheme.bodyText2!.
            copyWith(
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            children:[
              // TextSpan(text: 'Be a Hero and save it.',
              //     style: Theme.of(context).textTheme.bodyText2!.
              //     copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: mainColor,
              //     ),),

            ],
          ),
        )
      ],
    );
  }
}
