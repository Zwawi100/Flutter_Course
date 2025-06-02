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
    TaskScreen(),
    ProfileScreen()
  ];

  void _tapBottomItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _tapBottomItem,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.task),
                label: "Task",
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.brown)
          ]),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello from Home Page"),
      ),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  // onPageChanged
  void _onPageChanged(index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.pexels.com/photos/3184465/pexels-photo-3184465.jpeg"),
                          fit: BoxFit.cover,
                          ),),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1581090700227-1e8e67d3f27e?auto=format&fit=crop&w=800&q=80"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("https://picsum.photos/400/200"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                width: _currentPage == index ? 20 : 12,
                height: 12,
                decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.black : Colors.grey,
                    borderRadius: BorderRadius.circular(6)),
              );
            }),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scafoldKey = GlobalKey<ScaffoldState>();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text("Hello from Dialog !"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Yes"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("No"),
            )
          ],
        );
      },
    );
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("you have tapped $text")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafoldKey,
      appBar: AppBar(
        title: Text("PopUp Menu Example"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'Edit') {
                _showSnackBar("Edit");
              } else if (value == 'Help') {
                _showSnackBar("Help");
              } else if (value == 'Logout') {
                _showDialog();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: "Edit", child: Text("Edit")),
              PopupMenuItem(value: "Help", child: Text("Help")),
              PopupMenuItem(
                value: "Logout",
                child: Text("Logout"),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text("Hello from Profile Page"),
      ),
    );
  }
}
