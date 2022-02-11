import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> children;
  final ValueChanged<int> onTap;

  TabBarWidget({
    required this.tabs,
    required this.children,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          toolbarHeight: 80,
          bottom: TabBar(
            onTap: onTap,
            indicatorColor: Colors.blue,
            indicatorWeight: 5,
            tabs: tabs,
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: SafeArea(
          child: TabBarView(children: children),
        ),
      ),
    );
  }
}