import 'package:eco_friendly/constants.dart';
import 'package:eco_friendly/size_config.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width= SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Container(
          width: width*0.7,
          height: height * 0.3,
          padding: EdgeInsets.all(height * 0.01),
          decoration: BoxDecoration(
              color: kPC.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.1),
                  offset: const Offset(-10, 10),
                  blurRadius: 10,
                ),
              ]
          ),
        child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0.1),
                    offset: const Offset(-10, 10),
                    blurRadius: 10,
                  ),
                ],
                color: Colors.white
            ),
            child: const Icon(Icons.question_mark, size: 40,color: kPC,),
          ),
          Text('Help Center', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          Text('Having trouble ?\nPlease contact us for help.', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),
          const Spacer(),
          ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.02)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(height * 0.01))),

              ),
              child:Text('Help center', style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold, color: kPC),),
              onPressed: (){},),

        ],
      ),
        );


  }
}
