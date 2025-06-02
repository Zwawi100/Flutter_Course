import 'package:flutter/material.dart';

void main() {
  runApp(Lab2());
}

class Lab2 extends StatelessWidget {
  const Lab2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(
            text: "Overview",
            icon: Icon(Icons.assignment),
          ),
          Tab(
            text: "Details",
            icon: Icon(Icons.details),
          ),
          Tab(
            text: "Settings",
            icon: Icon(Icons.settings),
          ),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverView(),
          Details(),
          settings()
        ]),
    );
  }
}
class OverView extends StatelessWidget {
  const OverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Overview page"),
    );
  }
}
class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Details page"),
    );
  }
}
class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings page"),
    );
  }
}
