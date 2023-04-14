import 'package:eco_friendly/controller/eventcategory_controller.dart';
import 'package:eco_friendly/view/event/events_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/helpers/constants.dart';


class ECategoryCardWidget extends StatefulWidget {
  int index;

  ECategoryCardWidget({required this.index, Key? key}) : super(key: key);

  @override
  State<ECategoryCardWidget> createState() => _ECategoryCardWidgetState();

}

class _ECategoryCardWidgetState extends State<ECategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final Ecategories = Provider.of<ECategoryController>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Test_Page.EVENTS_ROUTE_NAME, arguments: {
          'eCategoryId': Ecategories.getECategoriesList[widget.index].eCategoryId
        });
      },
      splashColor: pColor,
      focusColor: pColor,
      child: Container(
        alignment: Alignment.bottomLeft,
        height: height,
        width: width * 0.80,
        margin: EdgeInsets.all(height * 0.01),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(
                  Ecategories.getECategoriesList[widget.index].eCategoryImage!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.multiply)),
        ),
        child: Padding(
          padding: EdgeInsets.all(width * 0.01),
          child: Text(
            Ecategories.getECategoriesList[widget.index].eCategoryName!,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
