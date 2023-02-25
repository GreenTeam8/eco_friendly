import 'package:eco_friendly/controller/authentication_controller.dart';
import 'package:eco_friendly/controller/event_controller.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/view/profile/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/size_config.dart';

class EventDetailsWidget extends StatelessWidget {
  const EventDetailsWidget({Key? key}) : super(key: key);
  static const EVENTS_DETAILS_ROUTE_NAME = '/eventsDetailsScreen';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;
    final routeArguments = ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    ///e1,e2 e3.....
    final eventId = routeArguments['eventId'];
    final event =
    Provider.of<EventController>(context).findEventsById(eventId!);

    return Scaffold(
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
                            decoration:
                            BoxDecoration(
                              color: Colors.white,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                width: width,
                                height: height * 0.45,
                                child: Hero(
                                  tag: 'hero${event.eventId}',
                                  child: Image.network((event.eventImage!),
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
                                    color: mColor,
                                    size: 25,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                          '${event.eventNumber!}',
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!,
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
                'Join',
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
              backgroundColor: MaterialStateProperty.all(mColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
              padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.02))),
          onPressed: () {
            if(value.isAuth){

              print('joined');
              print(event.isJoinned);
              print(event.eventNumber!);
              print(event.eventName!);
            }else{
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Please Sign In !', style: Theme.of(context).textTheme.bodyText2!.copyWith(color: mainColor),),
                duration: Duration(seconds: 3),
              )
              );
            }
          },
        ),
      ),
    );
  }
}
