import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocks/game_block.dart';

class ScoreTab extends StatefulWidget {
  @override
  _ScoreTabState createState() => _ScoreTabState();
}

class _ScoreTabState extends State<ScoreTab> {
  @override
  Widget build(BuildContext context) {
    final GameBlock gameBlock = Provider.of<GameBlock>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Total games played: ${gameBlock.playedGames}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Games won: ${gameBlock.playedWins}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Games lost: ${gameBlock.playedLosses}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        RaisedButton(
          child: Text("Reset"),
          onPressed: () {
            setState(() {
              gameBlock.playedGames = 0;
              gameBlock.playedWins = 0;
              gameBlock.playedLosses = 0;
            });
          },
          color: Colors.lightBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.deepOrange),
          ),
        ),
      ],
    );
  }
}
