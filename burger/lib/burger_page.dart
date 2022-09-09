import 'package:burger/nutritions.dart';
import 'package:flutter/material.dart';

class BurgerPage extends StatefulWidget {

  bool reverse;

  BurgerPage({
    Key? key,
    required this.reverse,
  }) : super(key: key);


  @override
  State<BurgerPage> createState() => _BurgerPageState();
}

class _BurgerPageState extends State<BurgerPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.orangeAccent,
              child: Image(
                height: 350,
                width: double.maxFinite,
                image: AssetImage(widget.reverse ? 'images/chicken_burger.png' : 'images/bacon_burger.png'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // color: Colors.brown,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.reverse ? 'Chicken Burger' : 'Bacon Burger',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('5.9'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('-'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('24 min'),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam id accumsan risus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas pharetra convallis elit in elementum.'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Nutrition Quality',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Nutritions(value: 542, name: 'Calories', percents: 21),
                        Nutritions(value: 42, name: 'Proteins', percents: 18),
                        Nutritions(value: 64, name: 'Fats', percents: 28),
                        Nutritions(value: 82, name: 'Carbs.', percents: 23),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count != 0) {
                                          count -= 1;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(count.toString()),
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (count < 9) {
                                          count += 1;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                radius: 28,
                                child: Text(
                                    '${(9.95 * count).toStringAsFixed(2)}€',
                                style: TextStyle(color: Colors.black),),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text('Add to cart', style: TextStyle(
                                      color: Colors.black
                                    ),),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.shopping_cart,
                                    size: 30,
                                    color: Colors.orange,
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
