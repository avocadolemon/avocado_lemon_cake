import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
            radius: 5, backgroundColor: Colors.grey, child: Icon(Icons.home)),
        actions: [Row()],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
