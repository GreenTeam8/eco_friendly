import 'package:eco_friendly/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/category_controller.dart';
import '../../../model/category.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';


/// DEPRECATED
@deprecated
class Categories extends StatefulWidget {

  List<Category> categories;

   Categories({required this.categories,Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight! ;
    double width = SizeConfig.screenWidth! ;
    //var productItem;
    //final products = Provider.of<ProductController>(context).getProductsList!;
    return Container(
      height: height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
        return GestureDetector(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding/2, vertical: kPadding/2),
            child: Container(
              margin: const EdgeInsets.only(right: kMargin),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: width * 0.015,
                      style: _selectedIndex == index ? BorderStyle.solid : BorderStyle.none
                    )
                  )
              ),
              child: Text(widget.categories[index].categoryName!, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30,
                  color: _selectedIndex == index ? Colors.black : Colors.grey,
                  letterSpacing: 1.2,
              ),),
            ),
          ),
          onTap: (){
            setState(() {
              _selectedIndex = index;
            });

          },
        );
      },),
    );
  }


}
