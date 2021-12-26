import 'package:flutter/material.dart';
import 'package:tictactoe_game/const_fonts.dart';
import 'game_functions.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                      child:
                          PlayerScore(player: 'Player O', score: game.ohScore),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 10, 0),
                      child:
                          PlayerScore(player: 'Player X', score: game.exScore),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        game.tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700),
                        ),
                        child: Center(
                          child: Text(
                            game.displayExOh(index),
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

class PlayerScore extends StatelessWidget {
  const PlayerScore({
    required this.player,
    required this.score,
    Key? key,
  }) : super(key: key);
  final String player;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(player, style: myNewSmallFontWhite),
        const SizedBox(height: 20),
        Text(score.toString(), style: myNewSmallFontWhite),
      ],
    );
  }
}
