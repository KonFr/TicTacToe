import 'package:flutter/material.dart';
import '../models/game_ai.dart';

class GameBlock extends ChangeNotifier {
  GameAi _gameAi;

  GameAi get ai => this._gameAi;

  int playedGames = 0;
  int playedWins = 0;
  int playedLosses = 0;

  stopGame() {
    this._gameAi = null;
  }

  set startGame(bool value) {
    this._gameAi = GameAi(this);
    this._gameAi.gameStarted = true;
    notifyListeners();
  }
}
