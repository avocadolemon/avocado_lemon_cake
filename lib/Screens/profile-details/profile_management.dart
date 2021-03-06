import 'package:avocado_lemon_cake/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/drawer_menu.dart';
import 'components/profile_slider.dart';

class ProfileManagement extends StatefulWidget {
  const ProfileManagement({Key? key}) : super(key: key);

  @override
  State<ProfileManagement> createState() => _ProfileManagementState();
}

class _ProfileManagementState extends State<ProfileManagement> {
  String user = 'User name';
  String status = 'Wonderful day';

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
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
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
              height: 25.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage(ImageAssets.profile),
                  radius: 30.h,
                ),
                Text(
                  user,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 7.h),
                Text(
                  status,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: const Color(0xffD42343),
                      fontWeight: FontWeight.w500),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
                  ),
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
                  )
                ],
              ),
            ),

            //  user profile role

            SizedBox(
              height: 20.h,
            ),
            const ProfileSlider()
          ],
        ),
      ),
    );
  }
}
