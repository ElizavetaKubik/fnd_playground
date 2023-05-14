// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_element, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  static const List<MenuRowData> menuRow = [
    MenuRowData(Icons.favorite, 'Избранные'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  static const List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфиденциальность'),
    MenuRowData(Icons.date_range, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
    MenuRowData(Icons.sticky_note_2, 'Стикеры'),
  ];

  static const List<MenuRowData> thirdMenuRow = [
    MenuRowData(Icons.lock_clock, 'Apple Watch'),
  ];

  static const List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer, 'Вопросы о Telegram'),
  ];
  const UserProfile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Настройки'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            _UserInfo(),
            const SizedBox(height: 30),
            _MenuWidget(menuRow: menuRow),
            const SizedBox(height: 30),
            _MenuWidget(menuRow: secondMenuRow),
            const SizedBox(height: 30),
            _MenuWidget(menuRow: thirdMenuRow),
            const SizedBox(height: 30),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  const MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({super.key, required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Icon(data.icon),
              SizedBox(width: 16),
              Expanded(child: Text(data.text)),
              Icon(Icons.chevron_right),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 30),
              _AvatarWidget(),
              const SizedBox(height: 30),
              _UserNameWidget(),
              const SizedBox(height: 10),
              _UserPhoneWidget(),
              const SizedBox(height: 10),
              _UserNickNameWidget(),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Positioned(
          top: 25,
          right: 25,
          child: Text(
            'Изм.',
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
        )
      ],
    );
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@elizavetakubik',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+375 (33) 768 98 76',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Elizaveta Kubik',
      style: TextStyle(
        color: Colors.black87,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: const Placeholder(),
    );
  }
}
