import 'package:eco_friendly/view/home/home_widgets/banner_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../helpers/constants.dart';
import '../../../../helpers/size_config.dart';


class BannerCardWeb extends StatelessWidget {
  const BannerCardWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final String url = 'https://drive.google.com/file/d/1czqQGAT3IlVsusMNea5uYXmFsq9ZCgNJ/view?usp=sharing';
    return Container(
      height: height * 0.75,
      width: width,

      child: Stack(
        children: [
          BannerCardWidget(),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    .copyWith(color: mainColor, fontWeight: FontWeight.bold)),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all(pColor),
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                                side: MaterialStateProperty.all(
                                    const BorderSide(color: mainColor)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(height * 0.03))),
                            child: Text('Download Simulation',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: mainColor, fontWeight: FontWeight.bold)),
                            onPressed: () async{
                              //check url whether supported or not
                              if(await canLaunchUrl(Uri.parse(url))){
                                await launch(url,
                                    forceWebView: true,
                                );
                              }else{
                                print('Url is not supported');
                              }
                            },
                          )
                        ],
                      )
                    ],
                  )),
          ),
        ],
      ),
    );
  }
}
