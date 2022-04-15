import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSlider extends StatelessWidget {
  const ProfileSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Stack(
              children: [
                Container(
                  height: 320.h,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/unsplash_ZuIDLSz3XLg.png'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(15.h)),
                ),
                Positioned(
                  top: 20.h,
                  left: 35.w,
                  child: Container(
                    height: 30.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffA9A9A9),
                        borderRadius: BorderRadius.circular(5.h)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.photo_camera),
                        Text('Edit Image')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 300.h,
                  right: 100.w,
                  child: Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff2F2C2C),
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          '1 OF 20',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 220.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        'Sweet',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffD42343)),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.favorite),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '0 5M',
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
