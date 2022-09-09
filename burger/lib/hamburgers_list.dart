import 'package:burger/burger_page.dart';
import 'package:flutter/material.dart';

class HamburgersList extends StatefulWidget {
  int row;

  HamburgersList({Key? key, required this.row,}) : super(key: key);

  @override
  State<HamburgersList> createState() => _HamburgersListState();
}

class _HamburgersListState extends State<HamburgersList> {
  @override
  Widget build(BuildContext context) {
    int items = 10;
    Widget baconImage = Container(
      height: 160,
      child: Image(image: AssetImage('images/bacon_burger.png')),
    );
    Widget chickenImage = Container(
      height: 120,
      child: Image(image: AssetImage('images/chicken_burger.png')),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 300 : 240,
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items,
            itemBuilder: (context, index) {
              final bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 20, right: items == index ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BurgerPage(reverse: reverse)));
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                reverse ? 'Chicken Burger' : 'Bacon Burger',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    '9,95 €',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: reverse ? 65 : 50,
                    child: GestureDetector(
                      onTap: () {
                        // Click on the icon
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BurgerPage(
                              reverse: reverse,
                            ),
                          ),
                        );
                      },
                      child: reverse ? chickenImage : baconImage,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
