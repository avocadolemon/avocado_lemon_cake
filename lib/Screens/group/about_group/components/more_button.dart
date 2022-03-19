import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.circle,
          size: 10.h,
        ),
        Icon(
          Icons.circle,
          size: 15.h,
        ),
        Icon(
          Icons.circle,
          size: 10.h,
        ),
      ],
    );
  }
}
