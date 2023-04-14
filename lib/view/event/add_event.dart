/*

import 'package:flutter/material.dart';
import '../../helpers/constants.dart';

class AddEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/eco-logo.png',
            fit: BoxFit.contain, width: 150, height: 150),
        leading: IconButton(
          onPressed: () {
          },
          icon: const Icon(
            Icons.menu,
            color: pColor,
            size: 30,
          ),
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            color: pColor,
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add Event",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.widgets_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Event Location',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.location_on_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                onTap: (){},
                decoration: InputDecoration(
                  labelText: 'Event Date',
                  suffixIcon: Icon(
                    Icons.calendar_today,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Expanded(child:
                    TextFormField(
                  keyboardType: TextInputType.datetime,
                  onTap: (){},
                  decoration: InputDecoration(
                    labelText: 'Start Date',
                    suffixIcon: Icon(
                      Icons.access_time,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(child:
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    onTap: (){},
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      suffixIcon: Icon(
                        Icons.access_time,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Event Description',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.description_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text("Upload Image"),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: double.infinity,
                color: Colors.lightGreen,
                child: MaterialButton(
                    onPressed:() {},
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
