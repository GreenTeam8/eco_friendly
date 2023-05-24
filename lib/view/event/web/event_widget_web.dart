import 'package:eco_friendly/model/event.dart';
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

    return WillPopScope(
        onWillPop: () async {
      Navigator.of(context).pop();
      return false;
    },
        child:Container(
          padding: EdgeInsets.all(width * 0.02),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black87.withOpacity(0.4),


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
                          '${event.participantCount}',
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
                    Navigator.pushNamed(
                      context,
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
        )
    );
  }
}

