import 'package:avocado_lemon_cake/Screens/profile_management/components/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/profile_slider.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({Key? key}) : super(key: key);

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  // backgroundColor: const Color(0xff9C9C9C),
                  radius: 16.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Profile Management',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerMdenu()),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 38.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/image-222.png'),
                  radius: 24.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(fontSize: 13.sp),
                    ),
                    Text(
                      'Wonderful day',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: const Color(0xffD42343),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Icon(
                  Icons.save_as,
                  size: 20.h,
                  color: const Color(0xffD42343),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 20.h,
                      color: const Color(0xffffcc00),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Day 65',
                      style: TextStyle(
                          color: const Color(0xffffcc00), fontSize: 13.sp),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xffffcc00),
                      ),
                      Text(
                        'City Ibaque',
                        style: TextStyle(fontSize: 13.sp),
                      )
                    ],
                  ),
                  Text(
                    'Los Andes',
                    style: TextStyle(fontSize: 13.sp),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        color: Color(0xffffcc00),
                      ),
                      Text(
                        'Friends / Systems',
                        style: TextStyle(
                            color: const Color(0xffffcc00), fontSize: 13.sp),
                      )
                    ],
                  )
                ],
              ),
            ),

            //  user profile role
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30.h,
            ),
            const ProfileSlider()
          ],
        ),
      ),
    );
  }
}
