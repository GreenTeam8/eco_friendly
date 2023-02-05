import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/cart_controller.dart';
import '../../controller/products_controller.dart';
import '../../model/product.dart';
import '../../helpers/constants.dart';
import '../../helpers/size_config.dart';
import '../products/product_detail_widget.dart';
import '../products/product_widget_mobile.dart';
import '../profile/register_screen.dart';

class FavoritesScreen extends StatefulWidget {

  static String routeName = '/FavoriteScreen';
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
    final product = Provider.of<Product>(context,listen: false);
    final productsData = Provider.of<ProductController>(context,);

    return Scaffold(
      appBar: AppBar(
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

                      },)
                ],
              ),
            ),)
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/Like.json', height: height * 0.4 ,reverse: true),
              Center(child: Text('No Favorite items!', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.grey)))
            ],
          ),
        ),




    );





  }
}
