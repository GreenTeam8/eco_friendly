import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../helpers/size_config.dart';
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
      height: height * 0.4,
      width: width,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.category, color: Colors.grey[700], size: 20,),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith( fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Container(
              height: height * 0.35,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoriesData.getCategoriesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3/2,
                ),
                itemBuilder: (BuildContext context, int index) {
                      return ChangeNotifierProvider.value(
                          value: categories[index],
                          child: CategoryCardWidget(index: index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
