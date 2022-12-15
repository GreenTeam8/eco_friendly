import 'package:eco_friendly/controller/category_controller.dart';

import 'package:eco_friendly/view/products/products_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../controller/products_controller.dart';
import '../../../zhelpers/constants.dart';
import '../../../zhelpers/size_config.dart';

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
    final products = Provider.of<ProductController>(context, listen: false);
    Provider.of<ProductController>(context, listen: false).fetchProducts();

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductsScreen.PRODUCTS_ROUTE_NAME, arguments: {
          'CategoryId': categories.getCategoriesList[widget.index].categoryId
          //'productCategory': product.productCategory
        });
        //products.fetchProducts();
        print(products.getProductsList[widget.index].productName);
      },
      splashColor: kPC,
      focusColor: kPC,
      child: Container(
        alignment: Alignment.bottomLeft,
        height: height,
        width: width * 0.70,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            // color: controller.productsList[index].color,
            image: DecorationImage(
                image: NetworkImage(
                    categories.getCategoriesList[widget.index].categoryImage!),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.25), BlendMode.multiply)),
            boxShadow: [
              BoxShadow(
                  //color: productItem[index].color!.withOpacity(0.60),
                  color: Colors.black26.withOpacity(0.20),
                  offset: const Offset(6, 6),
                  blurRadius: 20)
            ]),
        child: Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: Text(
            categories.getCategoriesList[widget.index].categoryName!,
            //CategoryController.categoriesList[index].categoryName!,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
