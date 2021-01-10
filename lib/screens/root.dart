import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';
import 'package:zapUi/screens/call_page.dart';
import 'package:zapUi/screens/camera_page.dart';
import 'package:zapUi/screens/chat/chat_page.dart';
import 'package:zapUi/screens/settings_page.dart';
import 'package:zapUi/screens/status_page.dart';
import 'package:zapUi/theme/colors.dart';

class RootApp extends StatefulWidget {
  RootApp({Key key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: renderBoby(),
      bottomNavigationBar: renderFooter(),
    );
  }

  Widget renderBoby() {
    return IndexedStack(
      index: pageIndex,
      children: [
        StatusPage(),
        CallPage(),
        CameraPage(),
        ChatPage(),
        SettingsPage()
      ]
    );
  }

  Widget renderFooter() {
    List navigationItems = [
      { "label": "Satus", "icon": LineIcons.circle },
      { "label": "Calls", "icon": LineIcons.phone_square },
      { "label": "Photos", "icon": LineIcons.camera },
      { "label": "Chats", "icon": LineIcons.comment },
      { "label": "Settings", "icon": LineIcons.gear },
    ];

    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(color: greyColor,),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(navigationItems.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                children: [
                  Icon(
                    navigationItems[index]["icon"],
                    color: pageIndex == index
                      ? primary
                      : white.withOpacity(0.5)
                  ),
                  SizedBox(height: 5),
                  Text(
                    navigationItems[index]["label"],
                    style: TextStyle(
                      fontSize: 10,
                      color: pageIndex == index
                        ? primary
                        : white.withOpacity(0.5)
                    )
                  )
                ]
              ),
            );
          }),
        ),
      ),
    );
  }
}
