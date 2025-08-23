import 'package:flutter/material.dart';
import 'dart:async';

class FocusPage extends StatefulWidget {
  
final double selectedMinutes;
const FocusPage({super.key, required this.selectedMinutes});
  @override
  State<FocusPage> createState() => _FocusPageState();
}


class _FocusPageState extends State<FocusPage> {

late double _currentProgress;
late Timer _timer;
late int _totalDurationInSeconds;
int _elapsedSeconds = 0;


@override
void initState() {
  super.initState();
  _totalDurationInSeconds = (widget.selectedMinutes * 60).toInt();
  _currentProgress = 0.0; // Initial progress is 0.

  _startTimer();
}

@override
void dispose() {
  _timer.cancel();
  super.dispose();
}

//timer start method
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedSeconds < _totalDurationInSeconds) {
          _elapsedSeconds++;
          // 4. Calculate the new progress value.
          _currentProgress = _elapsedSeconds / _totalDurationInSeconds;
        } else {
          // Timer has finished
          _timer.cancel();
        }
      });
    });
  }

//method for displaying timer



  @override
  Widget build(BuildContext context) {
    final int remainingSeconds = _totalDurationInSeconds - _elapsedSeconds;
    final Duration timeLeft = Duration(seconds: remainingSeconds);
    final String timeLeftString = timeLeft.toString().split('.').first;


    return Scaffold(
      backgroundColor: const Color(0xFFDDCAB8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 405,
            ),
            Text(
              timeLeftString,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),

            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: LinearProgressIndicator(
                value: _currentProgress,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.brown),
                backgroundColor: Colors.grey,
              ),
            ),

            
        
            OutlinedButton(onPressed: () {Navigator.pop(context);},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                side: const BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              shape: RoundedRectangleBorder(

                
              )
            ),
            child: Text('End', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              
            ),))
          ],
        ),
      )
    );
  }
}