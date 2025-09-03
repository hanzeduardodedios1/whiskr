import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whiskr/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
      ),
      home: const LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//tap anywhere navigation logic


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});


//page navigation tapanywhere logic
void _tapAnywhere(BuildContext context) {
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => const TimerScreen()) 
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDCAB8),
      body: InkWell(
        onTap:() => _tapAnywhere(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text('Whiskr',
                style: GoogleFonts.josefinSans(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color(0xDD000000),
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 120,
              ),
              Text('Tap anywhere to begin',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Color(0xDD000000),
                ),
              ),
              Spacer(flex: 1,)
            ],
          ),
        )
      )
    );
  }
}