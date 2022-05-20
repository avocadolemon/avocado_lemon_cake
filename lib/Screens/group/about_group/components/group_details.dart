import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupDetails extends StatefulWidget {
  const GroupDetails({Key? key}) : super(key: key);

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 8.h, bottom: 10.h),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'About Us and Ages',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
              )),
        ),
        SizedBox(
          height: 190.h,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  ListTile(
                    leading: Text(
                      'Some Dummy Text',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                   ListTile(
                    leading: Text(
                      'Get Some Dummy Text',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                   ListTile(
                    leading: Text(
                      'Another Some Dummy Text',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                   ListTile(
                    leading: Text(
                      'Some Dummy Text',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                   ListTile(
                    leading: Text(
                      'Some Dummy Text',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
