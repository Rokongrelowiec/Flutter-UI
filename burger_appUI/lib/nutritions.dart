import 'package:flutter/material.dart';

class Nutritions extends StatelessWidget {
  Nutritions({
    Key? key,
    required this.value,
    required this.name,
    required this.percents,
  }) : super(key: key);

  int value;
  String name;
  int percents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 90,
      width: 80,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 20,
                width: 60,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                height: 70,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(name),
                    ),
                    Text('$percents%')
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(value.toString(), style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
