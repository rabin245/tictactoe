import 'package:flutter/material.dart';
import 'package:tictactoe_game/const_fonts.dart';
import 'game_functions.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameFunction>(
      create: (context) => GameFunction(context),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Consumer<GameFunction>(
          builder: (context, game, child) => Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player O', style: myNewSmallFontWhite),
                          const SizedBox(height: 20),
                          Text(game.ohScore.toString(),
                              style: myNewSmallFontWhite),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Player X', style: myNewSmallFontWhite),
                          const SizedBox(height: 20),
                          Text(game.exScore.toString(),
                              style: myNewSmallFontWhite),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          game.tapped(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(
                          child: Text(
                            game.displayExOh[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'TIC TAC TOE',
                    style: myNewSmallFontWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
