import 'package:flutter/material.dart';
import 'package:travel/screens/destination_screen.dart';

import '../models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Destinations',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                var destination = destinations[index];

                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DestinationScreen(destination: destination),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 210,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          bottom: 15,
                          child: Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${destination.activities.length} activities',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Text(
                                    destination.description,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  child: Image(
                                    height: 180,
                                    width: 180,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          destination.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
