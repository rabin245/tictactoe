import 'package:flutter/material.dart';

class GameFunction extends ChangeNotifier {
  GameFunction(this.context);

  BuildContext context;
  bool ohTurn = true; //first player is O
  List<String> _displayExOh = ['', '', '', '', '', '', '', '', ''];
  int _ohScore = 0;
  int _exScore = 0;
  int filledBoxes = 0;

  void tapped(index) {
    if (ohTurn && _displayExOh[index] == '') {
      _displayExOh[index] = 'o';
      filledBoxes += 1;
      ohTurn = !ohTurn;
    } else if (!ohTurn && _displayExOh[index] == '') {
      _displayExOh[index] = 'x';
      filledBoxes += 1;
      ohTurn = !ohTurn;
    }

    _checkWinner();
    notifyListeners();
  }

  void _checkWinner() {
    // checks 1st row
    if (_displayExOh[0] == _displayExOh[1] &&
        _displayExOh[0] == _displayExOh[2] &&
        _displayExOh[0] != '') {
      _showWinDialog(_displayExOh[0]);
    }

    // checks 2nd row
    else if (_displayExOh[3] == _displayExOh[4] &&
        _displayExOh[3] == _displayExOh[5] &&
        _displayExOh[3] != '') {
      _showWinDialog(_displayExOh[3]);
    }

    // checks 3rd row
    else if (_displayExOh[6] == _displayExOh[7] &&
        _displayExOh[6] == _displayExOh[8] &&
        _displayExOh[6] != '') {
      _showWinDialog(_displayExOh[6]);
    }

    // checks 1st column
    else if (_displayExOh[0] == _displayExOh[3] &&
        _displayExOh[0] == _displayExOh[6] &&
        _displayExOh[0] != '') {
      _showWinDialog(_displayExOh[0]);
    }

    // checks 2nd column
    else if (_displayExOh[1] == _displayExOh[4] &&
        _displayExOh[1] == _displayExOh[7] &&
        _displayExOh[1] != '') {
      _showWinDialog(_displayExOh[1]);
    }

    // checks 3rd column
    else if (_displayExOh[2] == _displayExOh[5] &&
        _displayExOh[2] == _displayExOh[8] &&
        _displayExOh[2] != '') {
      _showWinDialog(_displayExOh[2]);
    }

    // checks diagonal
    else if (_displayExOh[6] == _displayExOh[4] &&
        _displayExOh[6] == _displayExOh[2] &&
        _displayExOh[6] != '') {
      _showWinDialog(_displayExOh[6]);
    }

    // checks diagonal
    else if (_displayExOh[0] == _displayExOh[4] &&
        _displayExOh[0] == _displayExOh[8] &&
        _displayExOh[0] != '') {
      _showWinDialog(_displayExOh[0]);
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
      _ohScore += 1;
    } else if (winner == 'x') {
      _exScore += 1;
    }
  }

  void _clearBoard() {
    for (int index = 0; index < 9; index++) {
      _displayExOh[index] = '';
    }

    filledBoxes = 0;
    notifyListeners();
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

  int get ohScore => _ohScore;

  int get exScore => _exScore;

  String displayExOh(int index) {
    return _displayExOh[index];
  }
}
