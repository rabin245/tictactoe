import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //first player is O
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
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
                      Text('Player O', style: myNewFontWhite),
                      const SizedBox(height: 20),
                      Text(ohScore.toString(), style: myNewFontWhite),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player X', style: myNewFontWhite),
                      const SizedBox(height: 20),
                      Text(exScore.toString(), style: myNewFontWhite),
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
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    child: Center(
                      child: Text(
                        displayExOh[index],
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
                style: myNewFontWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    else if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    else if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    else if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    else if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    else if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    else if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    else if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Winner is ' + winner.toUpperCase()),
          actions: [
            TextButton(
              child: const Text('Play again'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int index = 0; index < 9; index++) {
        displayExOh[index] = '';
      }
    });
    filledBoxes = 0;
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: [
            TextButton(
              child: const Text('Play again'),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
