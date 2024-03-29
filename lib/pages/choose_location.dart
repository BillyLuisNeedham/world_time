import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'uk.png'),
    WorldTime(url: 'Europe/Cairo', location: 'Cairo', flag: 'uk.png'),
    WorldTime(url: 'Europe/Nairobi', location: 'Nairobi', flag: 'uk.png'),
    WorldTime(url: 'Europe/Chicago', location: 'Chicago', flag: 'uk.png'),
    WorldTime(url: 'Europe/New_York', location: 'New York', flag: 'uk.png'),
    WorldTime(url: 'Europe/Seoul', location: 'Seoul', flag: 'uk.png'),
    WorldTime(url: 'Europe/Jakarta', location: 'Jakarta', flag: 'uk.png'),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
                leading: Icon(
                  Icons.lock_clock,

                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
