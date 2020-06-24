import 'package:flutter/material.dart';
import './models/GoPlanTab.dart';
import 'dart:async';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Tic Tac Toe'),
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
  bool _welcomeMessage = false;
  static const List<GoPlanTab> _tabs = const <GoPlanTab>[
    const GoPlanTab(title: "Start Game", icon: Icons.gamepad),
    const GoPlanTab(title: "Score", icon: Icons.score),
  ];

  _welcomeCountdown() {
    if (!_welcomeMessage) {
      Timer(Duration(seconds: 2), () {
        setState(() {
          _welcomeMessage = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _welcomeCountdown();
    return _welcomeMessage
        ? DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(widget.title),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: _tabs.map((GoPlanTab tab) {
                    return Container(
                      margin: const EdgeInsets.only(left: 42, right: 42),
                      child: Tab(
                        text: tab.title,
                        icon: Icon(tab.icon),
                      ),
                    );
                  }).toList(),
                ),
              ),
              body: TabBarView(
                children: _tabs.map((GoPlanTab tab) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("content"),
                  );
                }).toList(),
              ),
            ))
        : Scaffold(
            body: Center(
              child: Text(
                "Welcome to Goalplan Tic-Tac-Toe",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.deepOrange,
                ),
              ),
            ),
          );
  }
}
