import 'dart:async';
import 'dart:math';

import '../blocks/game_block.dart';

class GameAi {
  static const WIN_OPTIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  static const String _userSymbol = "O";
  static const String _deviceSymbol = "X";

  Map cells;
  List<int> winningSequence = [];
  bool gameStarted = false;
  bool gameEnded = false;
  bool usersTurn = false;
  bool defeat = false;
  bool win = false;
  bool draw = false;
  GameBlock _gameBlock;

  GameAi(this._gameBlock) {
    this.cells = {
      0: "",
      1: "",
      2: "",
      3: "",
      4: "",
      5: "",
      6: "",
      7: "",
      8: "",
    };

    usersTurn = Random().nextBool();
  }

  usersMove(int idx) {
    if (this.gameEnded) {
      return;
    }

    this.cells[idx] = _userSymbol;

    _moveWinsOrDraw(true);
  }

  deviceMove(Function callback) {
    if (this.cells.containsValue("")) {
      Timer(Duration(seconds: 1), () {
        bool moveMade = false;
        while (!moveMade) {
          int rand = Random().nextInt(9);
          if (this.cells[rand] == "") {
            this.cells[rand] = _deviceSymbol;
            moveMade = true;
            this.usersTurn = true;

            _moveWinsOrDraw(false);

            callback();
          }
        }
      });
    }
  }

  _moveWinsOrDraw(bool isUsersMove) {
    String symbol = isUsersMove ? _userSymbol :_deviceSymbol;
    WIN_OPTIONS.forEach((winRow) {
      int symbolsCount = 0;
      winRow.forEach((element) {
        if (this.cells[element] == symbol) {
          symbolsCount++;
        }

        if (symbolsCount == 3) {
          this.defeat = !isUsersMove;
          this.win = isUsersMove;
          this.gameEnded = true;
          this.winningSequence = winRow;
          _recordResult();

          return;
        }
      });
    });

    if (!this.cells.containsValue("")) {
      this.draw = true;
      this.gameEnded = true;
      _recordResult();
    }
  }

_recordResult() {
    this._gameBlock.playedGames++;

    if (this.win) {
      this._gameBlock.playedWins++;
    }

    if (this.defeat) {
      this._gameBlock.playedLosses++;
    }
  }
}
