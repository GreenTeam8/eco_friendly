import 'package:eco_friendly/controller/eventcategory_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/view/home/home_widgets/event_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../helpers/size_config.dart';


class ECategoryCardMobile extends StatelessWidget {
  const ECategoryCardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final ecategoriesData = Provider.of<ECategoryController>(context);
    final ecategories = ecategoriesData.getECategoriesList;
    return Container(
      height: height * 0.4,
      width: width,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.event, color: Colors.grey[700], size: 20,),
                Text(
                  'Events',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith( fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Container(
              height: height * 0.35,
              child: GridView.builder(
                itemCount: ecategoriesData.getECategoriesList.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/2,
                  crossAxisSpacing: width * 0.01,
                  mainAxisSpacing: height *0.01,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ChangeNotifierProvider.value(
                      value: ecategories[index],
                      child: ECategoryCardWidget(index: index));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
