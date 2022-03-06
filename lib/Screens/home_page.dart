import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('main menu')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
