import 'package:flutter/material.dart';

import '../../../helpers/size_config.dart';

class SideItemsWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  VoidCallback onTap;

  SideItemsWidget(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    //double height = SizeConfig.screenHeight!;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey[700],
          ),
          SizedBox(
            width: width * 0.003,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: Colors.grey[700], fontSize: width <= 880 ? 11 : null),
          )
        ],
      ),
    );
  }
}
