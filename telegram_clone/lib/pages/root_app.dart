import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telegram_clone/pages/chats_page.dart';
import 'package:telegram_clone/pages/contact_page.dart';
import 'package:telegram_clone/theme/colors.dart';
import 'package:badges/badges.dart' as badges;

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        ContactPage(),
        Center(
          child: Text(
            'Calls',
            style: TextStyle(color: white),
          ),
        ),
        ChatsPage(),
        Center(
          child: Text(
            'Settings',
            style: TextStyle(color: white),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    const List iconItems = [
      CupertinoIcons.person_crop_circle_fill,
      CupertinoIcons.phone_fill,
      CupertinoIcons.chat_bubble_2_fill,
      CupertinoIcons.settings,
    ];
    const List textItems = [
      'Contacts',
      'Calls',
      'Chat',
      'Settings',
    ];
    return Container(
        height: 90,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: greyColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(iconItems.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    index == 2
                        ? badges.Badge(
                            badgeContent: const Text(
                              "3",
                              style: TextStyle(color: white),
                            ),
                            child: Icon(iconItems[index],
                                size: 30,
                                color: pageIndex == index
                                    ? primary
                                    : white.withOpacity(0.5)),
                          )
                        : Icon(iconItems[index],
                            size: 30,
                            color: pageIndex == index
                                ? primary
                                : white.withOpacity(0.5)),
                    const SizedBox(height: 10),
                    Text(textItems[index],
                        style: TextStyle(
                            fontSize: 12,
                            color: pageIndex == index
                                ? primary
                                : white.withOpacity(0.5))),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}
