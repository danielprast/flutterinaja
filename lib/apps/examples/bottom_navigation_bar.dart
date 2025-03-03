import 'package:flutter/material.dart';

class BottomNavBarDemo extends StatefulWidget {
  //
  const BottomNavBarDemo({super.key});

  @override
  State<BottomNavBarDemo> createState() => _BottomNavBarDemoState();
}

class _BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onTapView() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      Text('Index 0: Home', style: optionStyle),
      Text('Index 1: Business', style: optionStyle),
      Column(
        children: [
          Text('Index 2: School', style: optionStyle),
          ElevatedButton(
            onPressed: _onTapView,
            child: const Text('Show Home'),
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navbar Demo'),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTaped,
      ),
    );
  }
}
