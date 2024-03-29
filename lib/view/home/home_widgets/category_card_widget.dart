import 'package:eco_friendly/controller/category_controller.dart';

import 'package:eco_friendly/view/products/products_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../controller/products_controller.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';

class CategoryCardWidget extends StatefulWidget {
  int index;

  CategoryCardWidget({required this.index, Key? key}) : super(key: key);

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget> {
  //var _isInit = true;

  // @override
  // void didChangeDependencies() {
  //   if(_isInit){
  //     Provider.of<ProductController>(context, listen: false).fetchProducts();
  //     _isInit = false;
  //   }
  //   super.didChangeDependencies();
  // }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final categories = Provider.of<CategoryController>(context, listen: false);
    //final products = Provider.of<ProductController>(context, listen: false);
    //Provider.of<ProductController>(context, listen: false).fetchProducts();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductsScreen.PRODUCTS_ROUTE_NAME, arguments: {
          'CategoryId': categories.getCategoriesList[widget.index].categoryId
          //'productCategory': product.productCategory
        });
        //products.fetchProducts();
        // print(products.getProductsList[widget.index].productName);
      },
      splashColor: mColor,
      focusColor: mColor,
      child: Container(
        //alignment: Alignment.center,
        height: height,
        width: width * 0.70,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
         // color: mColor.withOpacity(0.4),
          color: mainColor.withOpacity(0.4)
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
              child: Image.network(categories.getCategoriesList[widget.index].categoryImage!,
                fit: BoxFit.contain,
                height: height * 0.20,
              )
          ),
        ),
        Text(
          categories.getCategoriesList[widget.index].categoryName!,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                color: mColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding:  EdgeInsets.all(width * 0.005),
                    child: Image.asset('assets/images/100-percent.png',
                      width: 50, height: 50,
                      fit: BoxFit.contain,
                      color: Colors.lime,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See all',
                    style:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade200),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey.shade200, size: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
// alignment: Alignment.bottomLeft,
// height: height,
// width: width * 0.70,
// margin: EdgeInsets.all(height * 0.01),
// decoration: BoxDecoration(
// borderRadius: const BorderRadius.all(Radius.circular(10)),
// image: DecorationImage(
// image: NetworkImage(
// categories.getCategoriesList[widget.index].categoryImage!),
// fit: BoxFit.cover,
// colorFilter: ColorFilter.mode(
// Colors.black.withOpacity(0.35), BlendMode.multiply)),
// ),
// child: Padding(
// padding: EdgeInsets.all(width * 0.01),
// child: Text(
// categories.getCategoriesList[widget.index].categoryName!,
// style: const TextStyle(
// fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
// ),
// ),
// ),