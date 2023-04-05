import 'dart:io';

import 'package:dart_test_app/dart_test_app.dart' as dart_test_app;

String foo1(int a, int b, [int c = 0, int d = 0]) {
  return '';
}

String foo2(int a, int b, {int c = 0, int d = 0}) {
  return '';
}

void main(List<String> arguments) {
  // print("Введите что-то:");
  // final line = stdin.readLineSync();
  // print(line);

  foo2(3, 4, c: 5, d: 6);
}
