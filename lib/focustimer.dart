import 'package:flutter/material.dart';
import 'package:whiskr/focuspage.dart';

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
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            )

          ],
        ),
      ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FocusPage()));
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