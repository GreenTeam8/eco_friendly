import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../controller/products_controller.dart';
import '../../model/product.dart';
import '../../helpers/constants.dart';
import '../../helpers/size_config.dart';
import '../Home/home_screen.dart';
import '../products/mobile/product_detail_mobile.dart';

import '../profile/register_screen.dart';

class FavoritesScreen extends StatefulWidget {

  static String FAVORITES_ROUTE_NAME = '/FavoriteScreen';
   FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<ProductController>(context).fetchFavorites();
      _isInit = false;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final product = Provider.of<Product>(context,);
    final productsData = Provider.of<ProductController>(context,);
    final authenticated = Provider.of<AuthenticationController>(context);
    return Responsive(
        web: Scaffold(
          appBar: AppBar(
            leading: Responsive.checkPlatform() ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
            )
                : null,
            title: Text('Favorites', style: Theme.of(context).textTheme.bodyText1,),),

          body: Consumer<AuthenticationController>(
            builder: (context, value, child) =>
            value.isAuth ?
            ListView.builder(
              itemCount: productsData.getFavsList.length,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(width * 0.01),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: width * 0.1,
                        child: Image.network(productsData.getFavsList[index].productImage!,)),
                    Expanded(child: Text(productsData.getFavsList[index]!.productName!)),
                    IconButton(
                      icon: Icon(Icons.favorite, color: Colors.red,),
                      onPressed: (){
                        productsData.deleteFavProduct(value.userId, product.productId!);

                        //productsData.toggleFavoriteStatue(authenticated.userId, product);
                      },)
                  ],
                ),
              ),)
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               // Lottie.asset('assets/lottie/Like.json', height: height * 0.4 ,),
                Center(child: Text('No Favorite items!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)))
              ],
            ),
          ),


        ),
        mobile:
         Scaffold(
          appBar: AppBar(
            leading: Responsive.checkPlatform() ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
            )
            : null,
            title: Text('Favorites', style: Theme.of(context).textTheme.bodyText1,),),

          body: Consumer<AuthenticationController>(
              builder: (context, value, child) =>
              value.isAuth ?
              ListView.builder(
                itemCount: productsData.getFavsList.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(width * 0.01),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: width * 0.1,
                          child: Image.network(productsData.getFavsList[index].productImage!,)),
                      Expanded(child: Text(productsData.getFavsList[index]!.productName!)),
                      IconButton(
                          icon: Icon(Icons.favorite, color: Colors.red,),
                          onPressed: (){
                              productsData.deleteFavProduct(value.userId, product.productId!);

                            //productsData.toggleFavoriteStatue(authenticated.userId, product);
                          },)
                    ],
                  ),
                ),)
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lottie/Like.json', height: height * 0.4 ,),
                  Center(child: Text('No Favorite items!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)))
                ],
              ),
            ),


        ));
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: Responsive.checkPlatform() ? IconButton(
    //       icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
    //       onPressed: () {
    //         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
    //       },
    //     )
    //     : null,
    //     title: Text('Favorites', style: Theme.of(context).textTheme.bodyText1,),),
    //
    //   body: Consumer<AuthenticationController>(
    //       builder: (context, value, child) =>
    //       value.isAuth ?
    //       ListView.builder(
    //         itemCount: productsData.getFavsList.length,
    //         itemBuilder: (context, index) => Container(
    //           padding: EdgeInsets.all(width * 0.01),
    //           child: Row(
    //             children: [
    //               CircleAvatar(
    //                   backgroundColor: Colors.transparent,
    //                   radius: width * 0.1,
    //                   child: Image.network(productsData.getFavsList[index].productImage!,)),
    //               Expanded(child: Text(productsData.getFavsList[index]!.productName!)),
    //               IconButton(
    //                   icon: Icon(Icons.favorite, color: Colors.red,),
    //                   onPressed: (){
    //                       productsData.deleteFavProduct(value.userId, product.productId!);
    //
    //                     //productsData.toggleFavoriteStatue(authenticated.userId, product);
    //                   },)
    //             ],
    //           ),
    //         ),)
    //           : Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         //crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Lottie.asset('assets/lottie/Like.json', height: height * 0.4 ,),
    //           Center(child: Text('No Favorite items!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)))
    //         ],
    //       ),
    //     ),
    //
    //
    //
    //
    // );





  }
}
