import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/model/event.dart';
import 'package:eco_friendly/view/event/event_detail_widget.dart';
import 'package:eco_friendly/view/event/web/event_details_web.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';

class EventWidgetWeb extends StatelessWidget {
  const EventWidgetWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final event = Provider.of<Event>(context,listen: false);

    return Container(
      padding: EdgeInsets.all(width * 0.02),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87.withOpacity(0.4),

            /// added consumer to manipulate the favorites
            title: Column(children: [
              Hero(
                  tag: 'heroPrice${event.eventId}',
                  child: Text(
                    event.eventName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Hero(
                    tag: 'heroNum${event.eventId}',
                    child: Text(
                      '${event.eventNumber}',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Icon(Icons.people),
                ],
              ),
            ]),
          ),
          child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  EventDetailsWeb.EVENTS_DETAILS_WEB_ROUTE_NAME,
                  arguments: {'eventId': event.eventId},
                );
              },
              child: Hero(
                  tag: 'heroImage${event.eventId}',
                  child: Image.network(
                    event.eventImage!,
                    fit: BoxFit.fill,
                  ))),
        ),
      ),
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
