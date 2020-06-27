import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game_board.dart';
import '../blocks/game_block.dart';

class GameTab extends StatefulWidget {
  @override
  GameTabState createState() => GameTabState();
}

class GameTabState extends State<GameTab> {

  resetGameBoard() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final GameBlock gameBlock = Provider.of<GameBlock>(context);
    return (gameBlock.ai != null && gameBlock.ai.gameStarted)
        ? GameBoard(this.resetGameBoard)
        : Container(
            child: Center(
              child: RaisedButton(
                child: Text("Start!"),
                onPressed: () => {
                  setState(() => {gameBlock.startGame = true}),
                },
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepOrange),
                ),
              ),
            ),
          );
  }
}
