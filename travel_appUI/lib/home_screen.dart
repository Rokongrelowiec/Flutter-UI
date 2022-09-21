import 'package:flutter/material.dart';
import 'package:travel/wigets/destination_carousel.dart';
import 'package:travel/wigets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentTab = 0;
  int _selectedIndex = 0;

  var _icons = [
    Icons.airplanemode_active_outlined,
    Icons.bed,
    Icons.directions_walk_outlined,
    Icons.motorcycle,
  ];

  Widget _buildIcon(int index) => GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xffe7bee),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              _icons[index],
              size: 25,
              color: _selectedIndex == index
                  ? Theme.of(context).primaryColor
                  : Color(0xffb4c1c3),
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What would you find?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildIcon(e.key),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20,
            ),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (index){
          setState(() {
            _currentTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
