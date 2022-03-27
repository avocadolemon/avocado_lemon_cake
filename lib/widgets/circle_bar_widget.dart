import 'package:flutter/material.dart';

Widget circleBar(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 2),
    height: isActive ? 12 : 9,
    width: isActive ? 12 : 9,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}
