import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  static const USERPROFILESCREEN_ROUTE_NAME = '/userProfileScreen';

  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('hi User, profile coming soon!'),
          ),
          Consumer<AuthenticationController>(
            builder: (context, value, child)
            => ElevatedButton(
                child: Text('Logout'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(mColor)),
                onPressed: (){
                  value.logout();
                }, ),
          )
        ],
      ),
    );
  }
}
