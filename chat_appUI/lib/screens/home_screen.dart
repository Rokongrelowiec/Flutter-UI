import 'package:chat/widgets/favorite_contacts.dart';
import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';
import '../widgets/recents_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              showPopup();
            },
            icon: Icon(Icons.menu),
            color: Colors.white,
            iconSize: 30,
          ),
          title: TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.grey[800],
            decoration: InputDecoration.collapsed(
              hintStyle: TextStyle(color: Colors.white),
              hintText: 'Search in chat',
            ),
          ),
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              CategorySelector(),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      FavoriteContacts(),
                      RecentsChats(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showPopup() {
    var alert = AlertDialog(
      title: Text(
        'Popup',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
      content: Text(
        'This is a popup',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }
}
