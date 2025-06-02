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
          children: [OverView(), Details(), settings()]),
    );
  }
}

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  final TextEditingController _textController = TextEditingController();
    final List<String> _itmes = [
      "blabla",
      "shrimp",
      "jackson","messi","cr7","mo salah" ,"salad", "orange" , "walk","run","survive"
    ];

    List<String> _filteredList = [];
    bool _isTapped = false;

    @override
  void initState() {
    super.initState();
    _filteredList = _itmes;
  }

  // develop _filterSearchResults function
  void _filterSearchResults(String query){
    setState(() {
      if(query.isEmpty){
        _filteredList = _itmes;
      } else {
        _filteredList =
         _itmes.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search for ..',
            style: TextStyle(fontSize: 15, color: Colors.blueGrey),),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 0.8)
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Search ....',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.arrow_drop_down)
                    ),
                    onChanged: (value){
                      // filter
                      _filterSearchResults(value);
                      setState(() {
                        _isTapped = true;
                      });
                      // set state 
                    },
                    onTap: () {
                      setState(() {
                        _isTapped = true;
                      });
                    },
                  ),

                  _isTapped && _filteredList.isNotEmpty ?
                  Container(
                    height: 150,
                    color: Colors.grey.shade200,
                    child: ListView.builder(
                      itemCount: _filteredList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              _textController.text = _filteredList[index];
                              _isTapped = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            child: Text(_filteredList[index],style: TextStyle(fontSize: 15, color: Colors.black87),),
                            ),
                        );
                      }),
                  ) : SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
        
        
        
    );
  }
}

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String? _selectedValue;
  List<String> _items = ["hello", "Hola", "bonjour", "bonsoir", "Hi"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            hint: Text("Select your ....."),
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                    value: item, child: Text(item));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              }),
          SizedBox(
            height: 20,
          ),
          Text(
            _selectedValue == null ? "no selected value":
            "Your selected item: $_selectedValue")
        ],
      ),
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
