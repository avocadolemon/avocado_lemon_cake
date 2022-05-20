import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String groupImg = 'assets/images/unsplash_HgoKvtKpyHA.png';

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 40.w, top: 8.h),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color.fromARGB(255, 148, 148, 148),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_back_ios),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30.h)),
                height: 70.h,
                width: 240.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 10.w,
                      ),
                      child: CircleAvatar(
                        radius: 20.h,
                        backgroundImage: AssetImage(groupImg),
                      ),
                    );
                  },
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    );
  }
}
