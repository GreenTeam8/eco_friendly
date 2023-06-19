import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/event_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/view/event/mobile/event_comment_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';



class EventDetailsMobile extends StatefulWidget {
  const EventDetailsMobile({Key? key}) : super(key: key);
  static const EVENTS_DETAILS_ROUTE_NAME = '/eventsDetailsScreen';

  @override
  State<EventDetailsMobile> createState() => _EventDetailsMobileState();
}

class _EventDetailsMobileState extends State<EventDetailsMobile> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    final eventId = routeArguments['eventId'];
    final event =
    Provider.of<EventController>(context).findEventsById(eventId!);

    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked, //floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              child: Container(
                color: mColor,
                width: width,
                height: height * 0.4,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                width: width,
                                height: height * 0.45,
                                child: Hero(
                                  tag: 'hero${event.eventId}',
                                  child: Image.network(
                                    (event.eventImage!),
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 0.04),
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: mainColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Consumer<AuthenticationController>(
                                  builder: (context, auth, _) {
                                    return IconButton(
                                      icon: Icon(
                                        auth.isAuth ? Icons.comment : Icons.comments_disabled,
                                        color: auth.isAuth ? mColor : Colors.grey,
                                        size: 25,
                                      ),
                                      onPressed: auth.isAuth
                                          ? () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => EventCommentsScreen(eventId: eventId),
                                          ),
                                        );
                                      }
                                          : () {
                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please Sign In!',
                                              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),
                                            ),
                                            duration: Duration(seconds: 3),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Divider(color: pColor, height: height * 0.03),
                        Hero(
                          tag: 'heroText',
                          child: Text(
                            '${event.eventName!}',
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w800,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: height * 0.02, bottom: height * 0.02),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Row(
                              children: [
                                Text(
                                  '${event.eventCategory!}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: height * 0.07,
                              width: width * 0.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: 'Number',
                                    child: Text(
                                      '${event.participantCount}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.people_alt)
                                ],
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'Description:-',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Text(
                          '${event.eventDescription!}',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<AuthenticationController>(
        builder: (context, value, child) => ElevatedButton(
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
      ),
    );
  }
}


