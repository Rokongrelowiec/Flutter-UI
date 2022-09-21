import 'package:burger/burger_page.dart';
import 'package:burger/categories.dart';
import 'package:burger/hamburgers_list.dart';
import 'package:burger/header.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        appBarTheme: AppBarTheme(color: Colors.orangeAccent),
      ),
      debugShowCheckedModeBanner: false,
      home: Hamburger(),
    );
  }
}

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Deliver Me'),
              pinned: true,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  showSnackBar();
                },
                icon: Icon(Icons.menu),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ],
            ),
            Header(),
            Categories(),
            HamburgersList(
              row: 1,
            ),
            HamburgersList(
              row: 2,
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[700],
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.yellow[700],
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_alert,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.turned_in,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar() {
    var snackBar = SnackBar(
      content: Text('SnackBar'),
      action: SnackBarAction(
        onPressed: () {},
        label: 'Close',
        textColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
