import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone/theme/colors.dart';
import 'package:badges/badges.dart' as badges;

import '../json/chat_json.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(
              color: greyColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: const TextStyle(color: white),
                      cursorColor: primary,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.search,
                            color: white.withOpacity(0.3),
                          ),
                          hintText: 'Search for messages or users',
                          hintStyle: TextStyle(
                              fontSize: 17, color: white.withOpacity(0.3))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          getListChats(),
        ],
      ),
    );
  }

  Widget getListChats() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chatData.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(chatData[index]['img']),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width - 40) * 0.6,
                            child: Text(
                              chatData[index]['name'],
                              style: const TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            chatData[index]['date'],
                            style: TextStyle(
                                color: white.withOpacity(0.4), fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: size.width - 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chatData[index]['text'],
                              style: TextStyle(
                                color: white.withOpacity(0.4),
                                fontSize: 15,
                                height: 1.3,
                              ),
                            ),
                            chatData[index]['badge'] > 0
                                ? badges.Badge(
                                    badgeStyle: const badges.BadgeStyle(
                                        badgeColor: primary),
                                    badgeContent: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                        chatData[index]['badge'].toString(),
                                        style: const TextStyle(
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      Divider(
                        color: white.withOpacity(0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        'Chats',
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: white),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Text(
          'Edit',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: primary),
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            LineIcons.edit,
            color: primary,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
