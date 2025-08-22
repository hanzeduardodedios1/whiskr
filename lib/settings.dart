import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFDDCAB8),
        centerTitle: true,
        title: Text('Settings',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          
        ),),
      ),
    );
  }
}