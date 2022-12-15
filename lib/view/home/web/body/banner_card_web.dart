import 'package:flutter/material.dart';

import '../../../../zhelpers/constants.dart';
import '../../../../zhelpers/size_config.dart';

class BannerCardWeb extends StatelessWidget {
  const BannerCardWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    return Container(
      alignment: Alignment.bottomLeft,
      width: width,
      height: height * 0.7,
      margin: EdgeInsets.all(height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              image: const AssetImage('assets/images/banner.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.multiply)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26.withOpacity(0.30),
                offset: const Offset(-10, 10),
                blurRadius: 10)
          ]),
      child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Eco-Friendly Life \n',
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text:
                        'Our planet is crying out for us, lets be a united nation against the climate change.',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25))
              ])),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(height * 0.03))),
                    child: Text('Play Video',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: kPC, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(kPC),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        side: MaterialStateProperty.all(
                            const BorderSide(color: kPC)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.all(height * 0.03))),
                    child: Text('Download Simulation',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: kPC, fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  )
                ],
              )
            ],
          )),
    );
  }
}
