

import 'package:intl/intl.dart';

import '../../zhelpers/constants.dart';
import '../Home/mobile/search_mobile.dart';
import 'add_event.dart';

import 'package:flutter/material.dart';

import 'event_widgets/event_card_widget.dart';

class EventPage extends StatefulWidget {
  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/eco-logo.png',
            fit: BoxFit.contain, width: 150, height: 150),
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.menu,
            color: kPC,
            size: 30,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            color: kPC,
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Welcome
                        Text(
                          "Welcome user",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd').format(DateTime.now()),
                          style: TextStyle(color: Colors.blue[200],),
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.person_off,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SearchMobile(),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.white30,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Events',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                        child: EventCard(),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Text('Add Event'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 150))
        ),
        onPressed: (){Navigator.push(context, MaterialPageRoute( builder: (context)=>AddEventPage()));},
      )
    );
  }
}

// FloatingActionButton.extended(
// onPressed: (){},
// label:
// ,icon: Icon(Icons.add),
// backgroundColor: Colors.lightGreen,)