import 'package:eco_friendly/view/home/home_widgets/event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/controller/eventcategory_controller.dart';
import 'package:eco_friendly/model/eventcategory.dart';

class EventCardWeb extends StatelessWidget {
  const EventCardWeb ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final eventCategoriesData = Provider.of<ECategoryController>(context);
    final eventCategories = eventCategoriesData.getECategoriesList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Events',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Container(
          //width: width,
          height: height * 0.7,
          child: GridView.builder(
            itemCount: eventCategoriesData.getECategoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width <= 1000 ? 2 : 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: eventCategories[index],
                  child: ECategoryCardWidget(index: index));
            },
          ),
        ),
      ],
    );
  }
}
