import 'package:eco_friendly/controller/orders_controller.dart';
import 'package:eco_friendly/view/profile/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';
import '../Home/home_screen.dart';
import '../root_screen/root_screen.dart';
import 'orders_widgets/order_widget.dart';


class OrdersScreen extends StatefulWidget {

  static const ORDERS_SCREEN_ROUTE_NAME = '/orders_screen';

  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  Future? _ordersFuture;

  Future _obtainOrdersFuture (){
    return Provider.of<OrdersController>(context, listen: false).fetchOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrdersController>(context, listen: false);
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    return Scaffold(
        appBar: AppBar(title: Text('My Orders', style: Theme.of(context).textTheme.bodyText1,),
          leading: Responsive.isWeb(context)
              ? IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mColor, size: 25),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
            },
          )
              : IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mColor, size: 25),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(),));
              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
              //  Navigator.of(context).pushNamed(
              //                    HomeScreen.HOME_SCREEN_ROUTE_NAME,
              //                  );
            },
          ),
        ),
        body: FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
            }else {
              if(snapshot.error != null){
                print(snapshot.error);
                return Center(
                  child: Text('Error occurred'),);
              }else{
                    return ListView.builder(
                      itemCount: orders.getOrdersList.length,
                      itemBuilder: (context, index) {
                      return OrderItemWidget(orders.getOrdersList[index]);
                    },);
              }
            }
          },)

    );
  }
}
