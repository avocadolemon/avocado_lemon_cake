import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _currentIndex = 0;
  final List<String> imgList = [
    "assets/imgs/3.png",
    "assets/imgs/8.png",
    "assets/imgs/5.png",
    "assets/imgs/2.png",
    "assets/imgs/4.png",
    "assets/imgs/7.png",
    "assets/imgs/6.png",
    "assets/imgs/1.png",
  ];

  final List<String> title = [
    "The Photographers",
    "Second Hand & Vintage",
    "The Surfers",
    "Yoga",
    "Soccer",
    "Travel with Kids",
    "Bicycling",
    "Puppy",
  ];

  final List<String> subtitle = [
    "Everything Currently going on, or Coming up!!!",
    "Vintage lover, you have got your eyes set on the right city",
    "Let’s Go Surfers!!!",
    "“The Sky is not the limit. Your mind is”.",
    "Find a team near your!",
    "Take it slow and Leaves Plenty of Time.",
    "We go out to roll by all the routes that we can",
    "They’re Fluffy and playful, they yip and bark, and all they want is to be loved",
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            items: imgList.map((item) => backgroudImage(item)).toList(),
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title[_currentIndex],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              subtitle[_currentIndex],
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 155.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 42.h),
                      Container(
                        height: 230.h,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            getCommunity(
                              txt1: 'The Surfer',
                              txt2: 'The Photographers',
                              color1: const Color(0xFFEB682A),
                              color2: const Color(0xFFEA3948),
                            ),
                            SizedBox(height: 31.h),
                            getCommunity(
                              txt1: 'Second Hand & Vintage',
                              txt2: 'Football',
                              color1: const Color(0xFFD89F07),
                              color2: const Color(0xFFBF6D84),
                            ),
                            SizedBox(height: 31.h),
                            getCommunity(
                              txt1: 'Yoga',
                              txt2: 'Puppy',
                              color1: const Color(0xFF62BAB6),
                              color2: const Color(0xFFA9C80C),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100.h),
                      Container(
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                              thirdRowWidget(),
                              SizedBox(width: 26.w),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50.sp),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getCommunity({
    String? txt1,
    txt2,
    Color? color1,
    Color? color2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 56.h,
          width: 151.w,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              '$txt1',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 56.h,
              width: 151.w,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  '$txt2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const CircleAvatar(radius: 8, backgroundColor: Colors.red),
          ],
        ),
      ],
    );
  }

  Widget thirdRowWidget() {
    TextStyle grpStyle = TextStyle(
      fontSize: 12.sp,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    return Container(
      height: 117.h,
      width: 322.w,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 92,
            width: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/imgs/img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 45.w),
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Group name',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Name (of Sending)',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  'Last Message.....',
                  style: grpStyle,
                ),
                SizedBox(height: 12.h),
                Text(
                  '17 : 30   25 / 09',
                  style: grpStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget backgroudImage(String img) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFFFFFFF), Color.fromARGB(94, 0, 0, 0)],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
            colorFilter:
                const ColorFilter.mode(Colors.black45, BlendMode.lighten),
          ),
        ),
      ),
    );
  }
}
