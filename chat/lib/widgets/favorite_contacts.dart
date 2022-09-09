import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite Contacts',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.blueGrey,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(user: favorites[index]),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(favorites[index].imageUrl),
                          ),
                          SizedBox(height: 6),
                          Text(
                            favorites[index].name,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
