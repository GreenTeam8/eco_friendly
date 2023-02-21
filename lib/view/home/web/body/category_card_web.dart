import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../helpers/size_config.dart';
import '/view/home/home_widgets/category_card_widget.dart';
import '/controller/category_controller.dart';

class CategoryCardWeb extends StatelessWidget {
  const CategoryCardWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final categoriesData = Provider.of<CategoryController>(context);
    final categories = categoriesData.getCategoriesList;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.category, color: mainColor, size: 25,),
            Text(
              'Categories',
              style: Theme.of(context).textTheme.bodyText1!.copyWith( fontWeight: FontWeight.bold, ),
            ),

          ],
        ),
        Container(
          //width: width,
          height: height * 0.7,
          child: GridView.builder(
            itemCount: categoriesData.getCategoriesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width <= 1000 ? 2 : 3,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                  value: categories[index],
                  child: CategoryCardWidget(index: index));
            },
          ),
        ),
      ],
    );
  }
}
