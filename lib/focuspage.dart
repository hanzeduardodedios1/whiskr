import 'package:flutter/material.dart';

class FocusPage extends StatefulWidget {
  const FocusPage({super.key});

  @override
  State<FocusPage> createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDCAB8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
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