

import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/constants.dart';







class FooterWeb extends StatelessWidget {
  const FooterWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Container(
      width: width,
      height: height * 0.4,
      padding: EdgeInsets.only(top: 40),
      color:mColor,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/footer-image.jpg',),
      //         fit: BoxFit.cover,
      //         colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.multiply)
      //     )
      // ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: width *0.5,
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Contact us',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone,
                              color: Colors.white,
                            ),
                            onPressed: () {  },
                          ),
                          Text(
                            '00201021039857',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.email,
                              color: Colors.white,
                            ),
                            onPressed: () {  },
                          ),
                          Text(
                            'climatechange180@gmail.com',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Social Media',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () { },
                                      icon:SvgPicture.asset(
                                        'assets/images/facebook.svg',
                                        fit: BoxFit.contain,
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    IconButton(
                                      onPressed: () { },
                                      icon: SvgPicture.asset(
                                        'assets/images/twitter.svg',color:Colors.blue,
                                        fit: BoxFit.contain,
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    IconButton(
                                      onPressed: () { },
                                      icon: SvgPicture.asset(
                                        'assets/images/youtube.svg',
                                        fit: BoxFit.contain,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {  },
                          child:Text(
                            'Terms & Condition',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {  },
                          child:Text(
                            'Privacy & policy',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Our mission',
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //
                        //   ],
                        // ),
                        // SizedBox(height: 10,),
                        // Text(
                        //   'Together to fight climate change',
                        //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //     color: Colors.white,
                        //     fontSize: 18,
                        //     fontWeight:FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}