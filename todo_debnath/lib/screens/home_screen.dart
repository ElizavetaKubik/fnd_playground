import 'package:flutter/material.dart';
import 'package:todo_debnath/constants/colors.dart';
import 'package:todo_debnath/widgets/todo_item.dart';

import '../model/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoList = ToDo.todoList();

  final _addToDoTextFieldController = TextEditingController();

  List<ToDo> _foundToDo = [];

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBackground,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                _searchTextField(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 20),
                        child: const Text(
                          'All ToDos',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0,
                            color: tdGrey),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      focusNode: _focusNode,
                      // onEditingComplete: () {
                      //   _focusNode.unfocus();
                      // },
                      controller: _addToDoTextFieldController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_addToDoTextFieldController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _runFilter(String key) {
    List<ToDo> results = [];
    if (key.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where(
              (item) => item.title!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  void _addToDoItem(String title) {
    setState(() {
      todoList.add(ToDo(id: todoList.length, title: title));
    });
    _addToDoTextFieldController.clear();
    _focusNode.unfocus();
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(int id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  Padding _searchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black54,
              size: 25,
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 25,
              maxHeight: 20,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey, fontSize: 18),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBackground,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.black54,
        ),
        onPressed: () {},
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(const CircleBorder()),
              minimumSize: MaterialStateProperty.all(const Size(50, 50)),
              maximumSize: MaterialStateProperty.all(const Size(50, 50)),
            ),
            onPressed: () {},
            child: ClipOval(
              child: Image.asset(
                'assets/images/cat.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
