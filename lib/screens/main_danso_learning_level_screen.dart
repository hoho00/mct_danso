import 'package:flutter/material.dart';
import 'package:project_danso/common/const.dart';
import 'package:project_danso/widgets/widgets.dart';

class MainDansoLearningLevelScreen extends StatelessWidget {
  const MainDansoLearningLevelScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: tabbarAndAppBar(
          title: '단소 학습 익히기',
          tabbar: defaultTabBar(
            tabList: [
              Tab(text: '1'),
              Tab(text: '2'),
              Tab(text: '3'),
              Tab(text: '4'),
              Tab(text: '5'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            DansoStepByStep(currentLevel: '1', level: level1),
            DansoStepByStep(currentLevel: '2', level: level2),
            DansoStepByStep(currentLevel: '3', level: level3),
            DansoStepByStep(currentLevel: '4', level: level4),
            DansoStepByStep(currentLevel: '5', level: level5),
          ],
        ),
      ),
    );
  }
}