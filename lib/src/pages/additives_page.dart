import 'package:flutter/material.dart';

class AdditivesPage extends StatefulWidget {
  @override
  _AdditivesPageState createState() => _AdditivesPageState();
}

class _AdditivesPageState extends State<AdditivesPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(child: Text('Apto')),
          Tab(child: Text('No apto')),
          Tab(child: Text('Dudoso')),
          Tab(child: Text('Todos')),
        ],
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Container(color: Colors.white),
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
