import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'end_game_message.dart';
import '../blocks/game_block.dart';
import 'game_cell.dart';

class GameBoard extends StatefulWidget {
  final Function _backHome;

  GameBoard(this._backHome);

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    final GameBlock gameBlock = Provider.of<GameBlock>(context);

    if (gameBlock.ai.gameStarted &&
        !gameBlock.ai.gameEnded &&
        !gameBlock.ai.usersTurn) {
      gameBlock.ai.deviceMove(
        () => {
          setState(() => {}),
        },
      );
    }

    Color determineColor(int idx) {
      if (gameBlock.ai.gameEnded){
        if (gameBlock.ai.winningSequence.contains(idx)) {
          return gameBlock.ai.win ? Colors.lightGreen : Colors.red;
        }
      }

      return Colors.black;
    }

    return Container(
      child: Column(
        children: <Widget>[
          gameBlock.ai.gameEnded
              ? EndGameMessage(gameBlock.ai)
              : new Expanded(
                  flex: 1,
                  child: gameBlock.ai.usersTurn
                      ? Text(
                          "It's your turn, make your move!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        )
                      : Text(
                          "Wait, your device is thinking...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),
                        ),
                ),
          new Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 600,
                    height: 600,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: List.generate(9, (idx) {
                        return GameCell(
                          idx: idx,
                          onTap: (idx) => {
                            if (gameBlock.ai.usersTurn)
                              {
                                gameBlock.ai.usersMove(idx),
                                gameBlock.ai.usersTurn = false,
                                setState(() => {})
                              }
                          },
                          symbol: gameBlock.ai.cells[idx],
                          colorOfSymbol: determineColor(idx),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: gameBlock.ai.gameEnded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("New game"),
                        onPressed: () => {
                          setState(
                            () => {
                              gameBlock.startGame = false,
                            },
                          ),
                        },
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      RaisedButton(
                        child: Text("Back Home"),
                        onPressed: () {
                          gameBlock.stopGame();
                          widget._backHome();
                        },
                        color: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.deepOrange),
                        ),
                      ),
                    ],
                  )
                : Container(width: 0.0, height: 0.0),
          ),
        ],
      ),
    );
  }
}
