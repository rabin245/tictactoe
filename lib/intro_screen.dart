import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_game/const_fonts.dart';
import 'package:tictactoe_game/homepage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Text(
                    'TIC TAC TOE',
                    style: myNewFontWhite.copyWith(fontSize: 28),
                  ),
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
