import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/model/event.dart';
import 'package:eco_friendly/view/event/event_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';

class EventWidgetMobile extends StatelessWidget {
  const EventWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final event = Provider.of<Event>(context,listen: false);

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              EventDetailsWidget.EVENTS_DETAILS_ROUTE_NAME,
              arguments: {'eventId': event.eventId},
            );
          },
          child: SizedBox(
            height: height * 0.30,
            width: width * 0.90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          image:DecorationImage(image: NetworkImage(event.eventImage!), fit: BoxFit.cover)),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              CupertinoColors.black.withOpacity(.4),
                              CupertinoColors.black.withOpacity(.2),
                              CupertinoColors.black.withOpacity(.01),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${event.eventName!}',
                              style: TextStyle(
                                color: CupertinoColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Row(
                                 children: [
                                   const Icon(
                                     CupertinoIcons.time,
                                     color: CupertinoColors.white,
                                   ),
                                   const SizedBox(
                                     width: 5,
                                   ),
                                   Text(
                                     '${event.firstdateTime!}',
                                     style: TextStyle(
                                       color: CupertinoColors.white.withOpacity(.8),
                                       fontWeight: FontWeight.w500,
                                       fontSize: 16,
                                     ),
                                   ),
                                 ],
                               ),
                                Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.placemark,
                                      color: CupertinoColors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${event.eventCountry!}',
                                      style: TextStyle(
                                        color: CupertinoColors.white.withOpacity(.8),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                        ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Divider(
          color: mainColor,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }
}


/*
import 'package:eco_friendly/model/event.dart';
import 'package:eco_friendly/view/event/event_detail_widget.dart';
import 'package:eco_friendly/view/home/mobile/search_mobile.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';

class EventWidgetMobile extends StatelessWidget {
  const EventWidgetMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final event = Provider.of<Event>(context,listen: false);

    return Column(
      children: [
        SearchMobile(),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              EventDetailsWidget.EVENTS_DETAILS_ROUTE_NAME,
              arguments: {'eventId': event.eventId},
            );
          },
          child: Container(
            height: height * 0.30,
            margin: EdgeInsets.all(height * 0.01),
            padding: EdgeInsets.all(height * 0.01),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(height * 0.01),
                    margin: EdgeInsets.only(right: width * 0.01),
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: mainColor,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                child: Hero(
                  tag: 'hero${event.eventId}',
                  child: Image.network(event.eventImage!, fit: BoxFit.cover, width: 150, height: 150,))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName!,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(width * 0.01),
                        child: Text(
                          '${event.eventNumber!}',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/
