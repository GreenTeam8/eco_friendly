import 'package:eco_friendly/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../controller/authentication_controller.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/products_controller.dart';
import '../../../helpers/constants.dart';
import '../../../helpers/size_config.dart';
import '../../profile/register_screen.dart';

class EventDetailsWeb extends StatelessWidget {
  static const EVENTS_DETAILS_WEB_ROUTE_NAME = '/eventsDetailsWebScreen';
  const EventDetailsWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ///e1,e2 e3.....
    final eventId = routeArguments['eventId'];
    final event =
    Provider.of<EventController>(context).findEventsById(eventId!);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: ClipPath(
                child: Container(
                  color: mColor,
                  width: width,
                  height: height! * 0.2,
                ),
                clipper: OvalTopBorderClipper(),
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.all(width * 0.05),
              //height: height* 0.5,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(height * 0.01),
                      margin: EdgeInsets.only(right: width * 0.01),
                      width: width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: mainColor,),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Hero(
                        tag: 'heroImage${event.eventId}',
                        child: Image.network(
                          event.eventImage!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),),
                  Divider(height: height * 0.2, color: mColor,),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'heroName${event.eventId}',
                          child: Text(
                            event.eventName!,
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Category:',
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18
                                ),
                              ),
                              Hero(
                                tag: 'heroName${event.eventId}',
                                child: Text(
                                  event.eventCategory!,
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      fontWeight: FontWeight.w800,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.07,
                                width: width * 0.05,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: mainColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Hero(
                                    tag: 'heroNum${event.eventId}',
                                    child: Text(
                                      '${event.eventNumber}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                    Icon(Icons.people),
                                  ],
                                ),
                              )
                            ]),
                        Text(
                          'Description:-',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          event.eventDescription!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                          ,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
