import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../zhelpers/size_config.dart';
import '/view/home/home_widgets/category_card_widget.dart';
import '/controller/category_controller.dart';

class CategoryCardMobile extends StatelessWidget {
  const CategoryCardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final categoriesData = Provider.of<CategoryController>(context);
    final categories = categoriesData.getCategoriesList;
    return Container(
      height: height * 0.35,
      width: width,
      margin: EdgeInsets.only(top: height * 0.01),
      child: Column(
        children: [
          Text(
            'Products',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            height: height * 0.25,
            child: ListView.builder(
              itemCount: categoriesData.getCategoriesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: categories[index],
                    child: CategoryCardWidget(index: index));
              },
            ),
          )
        ],
      ),
    );
  }
}
