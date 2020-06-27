import 'package:flutter/material.dart';
import 'score_tab.dart';
import 'game_tab.dart';
import '../models/goplan_tab.dart';

class MainWindow extends StatelessWidget {
  final String mainWindowTitle;

  static List<GoPlanTab> _tabs = <GoPlanTab>[
    GoPlanTab(title: "Start Game", icon: Icons.gamepad, widget: GameTab()),
    GoPlanTab(title: "Score", icon: Icons.score, widget: ScoreTab()),
  ];

  MainWindow(this.mainWindowTitle);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(this.mainWindowTitle),
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabs.map((GoPlanTab tab) {
              return Container(
                width: (MediaQuery.of(context).size.width / 2) - 35,
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
              child: tab.widget,
            );
          }).toList(),
        ),
      ),
    );
  }
}
