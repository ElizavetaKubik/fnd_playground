import 'package:flutter/material.dart';
import 'package:todo_debnath/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.title,
          style: TextStyle(
              color: tdBlack,
              fontSize: 18,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              iconSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
