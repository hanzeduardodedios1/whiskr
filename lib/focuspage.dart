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
            FloatingActionButton(onPressed: () {
              Navigator.pop(context);
            },
            
            backgroundColor: Color(0xFFDDCAB8),
            shape: RoundedRectangleBorder(
              
              side: BorderSide(
                color: Colors.white,
                width: 2.0,
              )
            )
            ,
            child: Text('End',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),)
          ],
        ),
      )
    );
  }
}