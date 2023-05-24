import 'package:eco_friendly/helpers/responsive.dart';
import 'package:eco_friendly/view/event/mobile/event_widget_mobile.dart';
import 'package:eco_friendly/view/event/web/event_widget_web.dart';
import 'package:lottie/lottie.dart';
import 'package:eco_friendly/helpers/size_config.dart';
import 'package:eco_friendly/model/event.dart';
import 'package:eco_friendly/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eco_friendly/helpers/constants.dart';
import 'package:eco_friendly/view/root_screen/root_screen.dart';
import '../Home/home_screen.dart';


class Event_Screen extends StatefulWidget {
  static const EVENTS_ROUTE_NAME = '/events_screen';

  Event_Screen({Key? key}) : super(key: key);

  @override
  State<Event_Screen> createState() => _EventPageState();

}

class _EventPageState extends State<Event_Screen> {

  String? eCategoryId;

  List<Event>? fetchedEvents;

  var _isInit = true;

  Future? _eventFuture;

  Future _obtainEventsFuture (){

    return Provider.of<EventController>(context,listen: false).fetchEvents();
  }


@override
  void initState() {
    _eventFuture = _obtainEventsFuture();
    super.initState();
}

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight!;
    double width = SizeConfig.screenWidth!;

    final Map routeArguments =
    ModalRoute.of(context)?.settings.arguments as Map<String, String?>;

    eCategoryId = routeArguments['eCategoryId'];
    final loadedEvents = Provider.of<EventController>(context)
        .findAllEventsById(eCategoryId!);

    return Responsive(
      web: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacementNamed(HomeScreen.HOME_SCREEN_ROUTE_NAME);
          return false;
        },
        child:Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: Text(
                    eCategoryId!.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              leading:  IconButton(
                icon: Icon(Icons.arrow_back_ios, color: mColor, size: 25),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomeScreen.HOME_SCREEN_ROUTE_NAME);
                },
              )
            ),
            body: FutureBuilder(
                future: _eventFuture,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
                  }else{
                    return GridView.builder(
                      itemCount: loadedEvents.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: width <= 1000 ? 2 : 3,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: loadedEvents[index],
                            child: EventWidgetWeb());
                      },
                    );
                  }
                }),
           ),
      ),
      mobile: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Text(
                eCategoryId!.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1,
              )),
          leading:IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mColor, size: 25),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootScreen(),));
            },
          ),
        ),
        body: FutureBuilder(
            future: _eventFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
              }else{
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ListView.builder(
                            itemCount: loadedEvents.length,
                            itemBuilder: (context, index) {
                              /// .value is a good approach to use if we use provider on something that is a part of list
                              /// to make sure that the provider works even if the data changes
                              return ChangeNotifierProvider.value(
                                  value: loadedEvents[index], child: EventWidgetMobile());
                            },
                          ))
                    ]) ;
              }
            }),
      ),
    );
  }
}
