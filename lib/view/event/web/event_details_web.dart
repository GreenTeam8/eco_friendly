import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/helpers/size_config.dart';


class EventDetailsWeb extends StatefulWidget {
  static const EVENTS_DETAILS_WEB_ROUTE_NAME = '/eventsDetailsWebScreen';

  const EventDetailsWeb({Key? key}) : super(key: key);

  @override
  State<EventDetailsWeb> createState() => _EventDetailsWebState();
}

class _EventDetailsWebState extends State<EventDetailsWeb> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>?;

    if (routeArguments == null) {
      // Handle null route arguments
      return Container();
    }

    final eventId = routeArguments['eventId'];
    final event =
    Provider.of<EventController>(context).findEventsById(eventId!);
    final auth = Provider.of<AuthenticationController>(context, listen: false);

    return WillPopScope(
        onWillPop: () async {
      Navigator.of(context).pop();
      return false;
    },
        child:Scaffold(
          body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipPath(
                  child: Container(
                    color: mColor,
                    width: width,
                    height: height * 0.2,
                  ),
                  clipper: OvalTopBorderClipper(),
                ),
              ),
              Container(
                width: width,
                margin: EdgeInsets.all(width * 0.05),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(height * 0.01),
                        margin: EdgeInsets.only(right: width * 0.01),
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: mainColor,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Hero(
                          tag: 'heroImage$eventId',
                          child: Image.network(
                            event.eventImage ?? '', // Handle null event image
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: height * 0.2,
                      color: mColor,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'heroName$eventId',
                            child: Text(
                              event.eventName ?? '', // Handle null event name
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontWeight: FontWeight.w800,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20,
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
                                  fontSize: 18,
                                ),
                              ),
                              Hero(
                                tag: 'heroCategory$eventId', // Use a unique tag for the event category
                                child: Text(
                                  event.eventCategory ?? '', // Handle null event category
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    fontWeight: FontWeight.w800,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
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
                                  children: [
                                    Hero(
                                      tag: 'heroNum$eventId', // Use a unique tag for the number of event participants
                                      child: Text(
                                        '${event.participantCount}',
                                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.people),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Description:-',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            event.eventDescription ?? '', // Handle null event description
                            style: Theme.of(context).textTheme.bodyText2!,
                          ),
                          Consumer<AuthenticationController>(
                            builder: (context, value, child) => Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${event.isParticipant(value.userId) ? "Joined" : "Join"}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Icon(Icons.add)
                                    ],
                                  ),
                                  style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor: MaterialStateProperty.all(
                                          event.isParticipant(value.userId)
                                              ? Colors.grey
                                              : Colors.green),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(height * 0.02))),
                                  onPressed: () {
                                    if (value != null && value.isAuth) {
                                      if (event.isParticipant(value.userId)) {
                                        Provider.of<EventController>(context, listen: false)
                                            .removeParticipantFromEvent(event, value.userId);
                                      } else {
                                        Provider.of<EventController>(context, listen: false)
                                            .addParticipant(event, value.userId);
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                          'Please Sign In!',
                                          style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ));
                                    }
                                  },
                                ),
                              ],
                            ),
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
     )
    );
  }
}
