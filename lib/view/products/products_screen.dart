
import 'package:eco_friendly/view/products/web/product_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:eco_friendly/controller/products_controller.dart';

import '../../helpers/responsive.dart';
import '../../model/product.dart';
import '../../helpers/constants.dart';
import '../../helpers/size_config.dart';
import 'mobile/product_widget_mobile.dart';


class ProductsScreen extends StatefulWidget {
  static const PRODUCTS_ROUTE_NAME = '/products_screen';

  ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? productCategoryId;

  List<Product>? fetchedProducts;

  var _isInit = true;

  Future? _productFuture;

  Future _obtainProductsFuture (){

    return Provider.of<ProductController>(context, listen: false).fetchProducts();
  }


  @override
  void initState() {
    _productFuture = _obtainProductsFuture();
    super.initState();
  }
  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
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
    final Map routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ///appliances or electronics or plastic ban or plants
    productCategoryId = routeArguments['CategoryId'];
    final loadedProducts = Provider.of<ProductController>(context)
        .findAllProductsById(productCategoryId!);
    bool showFavorite = true;

    return Scaffold(
      ///Design for web and mobile
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Text(
              productCategoryId!.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1,
            )),
        leading: Responsive.isWeb(context) ? null : IconButton(
          icon: Icon(Icons.arrow_back_ios, color: mColor, size: 25),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
          future: _productFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
            }else{
              return Responsive.isWeb(context)
                  ? GridView.builder(
                itemCount: loadedProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width <= 1000 ? 2 : 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: loadedProducts[index],
                      child: ProductWidgetWeb());
                },
              )

                  : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: ListView.builder(
                          itemCount: loadedProducts.length,
                          itemBuilder: (context, index) {
                            /// .value is a good approach to use if we use provider on something that is a part of list
                            /// to make sure that the provider works even if the data changes
                            return ChangeNotifierProvider.value(
                                value: loadedProducts[index], child: ProductWidgetMobile());
                          },
                        ))
                  ]) ;
            }
          })


      ,
    );
  }
}