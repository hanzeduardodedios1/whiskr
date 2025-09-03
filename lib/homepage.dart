import 'package:flutter/material.dart';
import 'package:whiskr/focuspage.dart';
import 'package:whiskr/friends.dart';
import 'package:whiskr/settings.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

//variables
int timeRemaining = 10;
final List<int> minuteOptions = [5, 10, 15, 20, 25, 30, 45, 60];
int currentSelectedMinute = 25;
//timer method

//focus timer variables
  double _selectedMinutes = 25.0;
  double get selectedMinutes => _selectedMinutes;

  final double _minMinutes = 5.0;
  final double _maxMinutes = 60.0;
  final int _minuteStep = 5;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDCAB8),
      appBar: AppBar(
        backgroundColor: Color(0xFFDDCAB8),
        centerTitle: true,
        title: Text('The Scratch Post',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFDDCAB8),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('The Scratch Post'),
              onTap: () => Navigator.pop(context),
            ),
            
            ListTile(
              leading: Icon(Icons.timeline),
              title: Text('Timeline'),
            ),
            ListTile(
              leading: Icon(Icons.people_alt),
              title: Text('Friends'),
              onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => FriendsPage()),),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.push( context, MaterialPageRoute(builder: (context) => SettingsPage()), ),
            )

          ],
        ),
      ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
              ),
              Slider.adaptive(
                value: _selectedMinutes, 
                min: _minMinutes,
                max: _maxMinutes,
                divisions: ((_maxMinutes - _minMinutes) / _minuteStep).toInt(),
                label: '${_selectedMinutes.toInt()} min',

                onChanged: (double newValue) {
                  setState(() {
                    _selectedMinutes = newValue;
                  });
                  
                },
                activeColor: Colors.black,
                inactiveColor: Colors.grey.shade400,
                thumbColor: Colors.black,),


              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FocusPage(selectedMinutes: _selectedMinutes)));
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 253, 215, 203),
                foregroundColor: const Color(0xFF3E2723),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                elevation: 8.0,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              
              child: Text('Time to Focus!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                
                color: Colors.black,
                  ),
                ),
              ), 
            ],
          )
        ),
    );
  }
}