import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class RecentsChats extends StatelessWidget {
  const RecentsChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                var chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(user: chat.sender),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: chat.unread ? Colors.blueAccent[100] : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                    color: chat.unread ? Colors.white.withOpacity(0.9) : Colors.blueGrey.withOpacity(0.9),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                      color: chat.unread ? Colors.white : Colors.blueGrey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              chat.time,
                              style: TextStyle(
                                color: chat.unread ? Colors.blueGrey.shade700 : Colors.blueGrey.shade500,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            chat.unread
                                ? Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.red,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'NEW',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : Text(''),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
