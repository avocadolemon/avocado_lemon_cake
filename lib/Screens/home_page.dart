import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/community-screen');
            },
            child: const Text('View Community'),
          ),
        ],
      ),
    );
  }
}
