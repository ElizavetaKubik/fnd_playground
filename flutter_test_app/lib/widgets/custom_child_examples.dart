import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: CustomSingleChildLayout(
          delegate: OwnSingleChildLayoutDelegat(),
          child: Container(
            color: Colors.amber,
            width: 200,
            height: 100,
          ),
        ),
      ),
    );
  }
}

class OwnSingleChildLayoutDelegat extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}
