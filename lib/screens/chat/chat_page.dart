
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zapUi/data/json.dart';
import 'package:zapUi/theme/colors.dart';

import 'chat_detail.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      backgroundColor: bgColor,
      body: renderBody(),
    );
  }

  Widget renderAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      leading: IconButton(
        onPressed: null,
        icon: Text(
          "Edit",
          style: TextStyle(
            color: primary,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.edit,
            color: primary,
          ),
        )
      ],
    );
  }

  Widget renderBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chats",
                style: TextStyle(
                  color: white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: textfieldColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  style: TextStyle(color: white),
                  cursorColor: primary,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      LineIcons.search,
                      color: white.withOpacity(0.3)
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: white.withOpacity(0.3),
                      fontSize: 17
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Broadcast Lists",
                    style: TextStyle(
                      fontSize: 16,
                      color: primary,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    "New Group",
                    style: TextStyle(
                      fontSize: 16,
                      color: primary,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
          child: Divider(color: white.withOpacity(.5)),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(chatMessages.length, (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailPage(
                    name: chatData[index]['name'],
                    img: chatData[index]['img'],
                  )
                )
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(chatData[index]['img']),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (size.width - 40) * 0.6,
                                child: Text(chatData[index]['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  chatData[index]['date'],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: white.withOpacity(0.7)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: (size.width - 40) * 1,
                            child: Text(
                              chatData[index]['text'],
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.3,
                                color: white.withOpacity(0.4)),
                              ),
                          ),
                          Divider(color: white)
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ))
        ),
      ],
    );
  }
}
