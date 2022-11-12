import 'package:eco_friendly/constants.dart';
import 'package:eco_friendly/model/dummy_product_list.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ProductCard extends StatelessWidget {


   ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    return Container(
      height: height * 0.6,
      margin: EdgeInsets.only(top: kMargin/2),
      child: ListView.builder(
        itemCount: productItem.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: width * 0.75,
              margin: EdgeInsets.all(kMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productItem[index].color,
                boxShadow: [
                  BoxShadow(
                    color: productItem[index].color!.withOpacity(0.6),
                    offset: Offset(10,10),
                    blurRadius: 10
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kPadding),
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/images/''${productItem[index].image}'), width: width, height: height / 3,),
                        Text(productItem[index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: kPadding)),
                              backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.1)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                              elevation: MaterialStateProperty.all(1)
                          ),
                            child: const Text('Show Category', style: TextStyle(color: Colors.white),),
                            onPressed: (){},
                            ),

                      ],
                    ),
                  ),
                ],
              ),
            );
          },),
    );
  }
}
