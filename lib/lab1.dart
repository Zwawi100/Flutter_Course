import 'package:flutter/material.dart';

void main() {
  runApp(Lab1());
}

class Lab1 extends StatelessWidget {
  const Lab1({super.key});

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

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _selectedScreen = [
    HomeScreen(),
    SearchScreen(),
    ProductScreen()
  ];

  void _tapBottomItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex:_selectedIndex ,
      onTap: _tapBottomItem ,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home" ,backgroundColor: Colors.blue),
        BottomNavigationBarItem(icon: Icon(Icons.task) , label: "Task" ,backgroundColor: Colors.orange),
        BottomNavigationBarItem(icon: Icon(Icons.person) , label: "Profile" ,backgroundColor: Colors.brown)
      ]),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello from Home Page"),),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello from Task Page"),),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Hello from Profile Page"),),
    );
  }
}
