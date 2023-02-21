import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/view/profile/profile_widgets/profile_body_widget.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../helpers/size_config.dart';

class UserProfileScreen extends StatelessWidget {
  static const USERPROFILESCREEN_ROUTE_NAME = '/userProfileScreen';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipPath(
                child: Container(
                  color: mColor,
                  width: width,
                  height: height! * 0.40,
                ),
                clipper: OvalBottomBorderClipper(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.02),
                    height: height * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: width * 0.01),
                      shape: BoxShape.circle,
                    ),
                    child: Text('Hello User', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),),
                  ),
                  Text('Email@email.com',style: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey[500])),
                ],
              ),
            ],
          ),
        ),
      
        ProfileBodyWidget(title: 'MY ORDERS',iconSrc: Icons.delivery_dining, onPress: (){
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
              Responsive.isWeb(context)
                  ? Navigator.pushNamed(
                  context, RegisterScreen.REGISTERSCREEN_ROUTE_NAME)
                  : null;
            },
          ),
        )

      ],
    );
  }
}
