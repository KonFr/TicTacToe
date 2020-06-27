import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import './blocks/game_block.dart';
import 'dart:async';
import './widgets/main_window.dart';
import './widgets/welcome_screen.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => GameBlock(),
      child: MaterialApp(
        title: 'Tic Tac Toe Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(title: 'Tic Tac Toe'),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _widget = WelcomeScreen();

  _welcomeCountdown() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        _widget = MainWindow(widget.title);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _welcomeCountdown();
    return AnimatedSwitcher(
      duration: Duration(
        milliseconds: 1200,
      ),
      child: _widget,
    );
  }
}
