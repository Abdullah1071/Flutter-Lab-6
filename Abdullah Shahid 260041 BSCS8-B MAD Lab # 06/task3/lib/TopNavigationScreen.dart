import 'package:flutter/material.dart';
import './TabContent.dart';

class TopNavigationScreen extends StatefulWidget {
  static const route = '/top-navigation';

  TopNavigationScreen({Key? key}) : super(key: key);

  @override
  State<TopNavigationScreen> createState() => _TopNavigationScreenState();
}

class _TopNavigationScreenState extends State<TopNavigationScreen> {
  final tabContent = [
    const TabContent(label: 'LEFT', content: 'This is the left page'),
    const TabContent(label: 'MIDDLE', content: 'This is the middle page'),
    const TabContent(label: 'LEFT', content: 'This is the right page'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabContent
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(e.label),
                    ))
                .toList(),
          ),
          title: const Text('Top Navigation'),
        ),
        body: Center(
          child: TabBarView(
            children:
                tabContent.map((e) => Center(child: Text(e.content))).toList(),
          ),
        ),
      ),
    );
  }
}
