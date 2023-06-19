import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/view/orders/orders_screen.dart';
import 'package:eco_friendly/view/profile/profile_widgets/profile_body_widget.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../helpers/size_config.dart';
import '../Home/home_screen.dart';
import '../root_screen/root_screen.dart';

class UserProfileScreen extends StatelessWidget {
  static const USERPROFILESCREEN_ROUTE_NAME = '/userProfileScreen';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Scaffold(
      // appBar: AppBar(
      //   leading:
      //   Responsive.checkPlatform()
      //       ? IconButton(
      //     icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
      //     onPressed: () {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
      //     },)
      //       :null,
      // ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipPath(
                  child: Container(
                    color: mColor,
                    width: width,
                    height: height! * 0.45,
                  ),
                  clipper: OvalBottomBorderClipper(),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: mainColor, size: 25),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(),));
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      height: height * 0.15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: width * 0.005),
                        shape: BoxShape.circle,
                      ),
                      child: 
                        Image.asset('assets/images/profileIcon.png', color: Colors.white,)
                      //Text('Hello User', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),
                    ),
                    //Text('Email@email.com',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey[400])),
                  ],
                ),
              ],
            ),
          ),
        
          ProfileBodyWidget(title: 'MY ORDERS',iconSrc: Icons.delivery_dining,
              onPress: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => OrdersScreen(),)
            );
          }),
          ProfileBodyWidget(title: 'ABOUT US',iconSrc: Icons.info, onPress: (){
          }),
          Consumer<AuthenticationController>(
            builder: (context, value, child) => ElevatedButton(
              child: Text('Logout'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mColor),
                  elevation: MaterialStateProperty.all(0),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: width * 0.4)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))),
              onPressed: () {
                value.logout();
                //Navigator.pop(context);
                Responsive.checkPlatform()
                    ? Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => RegisterScreen(),))
                    : Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RootScreen(),));
              },
            ),
          )

        ],
      ),
    );
  }
}
