import 'package:flutter/material.dart';

import '../../../zhelpers/constants.dart';
import '../../../zhelpers/size_config.dart';

class SearchMobile extends StatelessWidget {
  const SearchMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final controller = TextEditingController();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.04),
            height: height * 0.07,
            width: width * 0.75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPC.withOpacity(0.3)),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: ' Search',
                  labelStyle: TextStyle(color: Colors.grey[600], fontSize: 20)),
              cursorColor: Colors.grey[600],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(height * 0.015),
              decoration: BoxDecoration(
                  color: kPC,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26.withOpacity(0.3),
                        offset: Offset(-10, 10),
                        blurRadius: 20)
                  ]),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
