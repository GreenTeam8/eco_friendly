import 'package:eco_friendly/view/event/event_bottom.dart';
import 'package:flutter/material.dart';
import '../../model/event.dart';
import 'event_widgets/event_card_widget.dart';


class EventDetails extends StatelessWidget {

  final Event event;
  EventDetails(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/''${event.image}'),
          fit: BoxFit.fill,
          opacity: 0.7,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: EventBottom(event),
      ),
    );
  }
}
