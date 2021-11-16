import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_game/homepage.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  'TIC TAC TOE',
                  style: myNewFontWhite.copyWith(fontSize: 30),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: AvatarGlow(
                endRadius: 140,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                child: Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[900],
                    child: Image.asset(
                      'images/tictactoelogo.png',
                      color: Colors.white,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'PLAY GAME',
                      style: myNewFont,
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
