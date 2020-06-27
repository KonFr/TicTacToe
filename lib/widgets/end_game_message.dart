import 'package:flutter/material.dart';
import '../models/game_ai.dart';

class EndGameMessage extends StatelessWidget {
  final GameAi gameAi;

  EndGameMessage(this.gameAi);

  @override
  Widget build(BuildContext context) {
    if (this.gameAi.gameEnded && this.gameAi.win) {
      return Expanded(
        flex: 1,
        child: Text(
          "Hooray! You won!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      );
    }

    if (this.gameAi.gameEnded && this.gameAi.defeat) {
      return Expanded(
        flex: 1,
        child: Text(
          "Oh no, you lost...",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      );
    }

    return Expanded(
      flex: 1,
      child: Text(
        "Draw",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
      ),
    );
  }
}
