import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:telegram_clone/theme/colors.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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

  Widget getSectionIcons() {
    List icons = [
      {"icon": LineIcons.mapMarker, "label": "Find People Nearby"},
      {"icon": LineIcons.userPlus, "label": "Invite Friends"}
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: List.generate(icons.length, (index) {
          return Column(
            children: [
              Row(
                children: [
                  Icon(icons[index]['icon'], color: primary, size: 28),
                  const SizedBox(width: 20),
                  Text(
                    icons[index]['label'],
                    style: const TextStyle(
                        color: primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Divider(
                  thickness: 1,
                  color: white.withOpacity(0.15),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 68,
            decoration: const BoxDecoration(color: greyColor),
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
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: white.withOpacity(0.3), fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          getSectionIcons(),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: greyColor,
      title: const Text(
        'Contacts',
        style:
            TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: white),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Text(
          'Sort',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: primary),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: primary,
            )),
      ],
    );
  }
}
