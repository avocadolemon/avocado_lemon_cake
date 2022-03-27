import 'package:avocado_lemon_cake/widgets/circle_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImageScreen extends StatefulWidget {
  const AddImageScreen({Key? key}) : super(key: key);

  @override
  State<AddImageScreen> createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> containers = [
      firstStage(),
      secondStage(),
      // thirdStage(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imgs/man.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      containers[_currentIndex],
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        bottom: 28.h,
                        start: 285.w,
                        end: 5.w,
                        child: GestureDetector(
                          onTap: () {
                            // if (_currentIndex == 2) {
                            //   setState(() {
                            //     _currentIndex == 2;
                            //   });
                            // } else {
                            //   setState(() {
                            //     _currentIndex += 1;
                            //   });
                            // }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFF534B4B),
                            child:
                                Icon(Icons.arrow_forward, color: Colors.white),
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.rtl,
                        bottom: 28.h,
                        start: 285.w,
                        end: 5.w,
                        child: GestureDetector(
                          onTap: () {
                            // if (_currentIndex == 0) {
                            //   setState(() {
                            //     _currentIndex == 0;
                            //   });
                            // } else {
                            //   setState(() {
                            //     _currentIndex -= 1;
                            //   });
                            // }
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFF534B4B),
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget firstStage() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 154.h,
          width: size.width,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 114.h,
                width: 311.w,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF534B4B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Lorem ipsum  ',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: size.width / 2 - 155),
                        pageBar(),
                      ],
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lorem ipsum | Lorem ipsum ',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Color(0xFFFFCC00),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 1;
              });
            },
            child: Container(
              height: 50,
              width: 182.w,
              decoration: BoxDecoration(
                color: const Color(0xFF2F2C2C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lorem ipsum  ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: Color(0xFFFFCC00),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget secondStage() {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 400.h,
          width: size.width,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 382.h,
                width: 311.w,
                decoration: BoxDecoration(
                  color: const Color(0xFF534B4B),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 48.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lorem ipsum  ',
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.red,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      height: 142.h,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            buildImageRow(),
                            SizedBox(width: 26.w),
                            buildImageRow(),
                            SizedBox(width: 26.w),
                            buildImageRow(),
                            SizedBox(width: 26.w),
                            buildImageRow(),
                            SizedBox(width: 26.w),
                            buildImageRow(),
                            SizedBox(width: 26.w),
                            buildImageRow(),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lorem ipsum  ',
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: size.width / 2 - 155),
                          pageBar(),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lorem ipsum | Lorem ipsum ',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Color(0xFFFFCC00),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = 0;
              });
            },
            child: Container(
              height: 50,
              width: 182.w,
              decoration: BoxDecoration(
                color: const Color(0xFF2F2C2C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lorem ipsum  ',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Icon(
                    Icons.camera_alt_outlined,
                    size: 18,
                    color: Color(0xFFFFCC00),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget thirdStage() {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: FittedBox(
        child: Container(
          height: 500.h,
          width: 311.w,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: const Color(0xFF534B4B),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 31.h),
              buildButton(txt: 'Lorem ipsum dolor', color: Colors.red),
              SizedBox(height: 26.h),
              buildButton(txt: 'Lorem ipsum dolor', color: Colors.blue),
              SizedBox(height: 26.h),
              buildButton(txt: 'Lorem ipsum dolor', color: Colors.pink),
              SizedBox(height: 26.h),
              buildButton(txt: 'Lorem ipsum dolor', color: Colors.yellow),
              SizedBox(height: 26.h),
              buildButton(txt: 'Lorem ipsum dolor', color: Colors.amber),
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lorem ipsum  ',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: size.width / 2 - 155),
                  pageBar(),
                ],
              ),
              SizedBox(height: 13.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lorem ipsum | Lorem ipsum ',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Color(0xFFFFCC00),
                  )
                ],
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageRow() {
    return Container(
      height: 142.h,
      width: 135.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/imgs/img.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildButton({String? txt, Color? color}) {
    return SizedBox(
      height: 40.h,
      width: 5000,
      child: MaterialButton(
        onPressed: () {},
        elevation: 0,
        color: const Color(0xFF2F2C2C),
        child: Text(
          '$txt',
          style: TextStyle(
            fontSize: 13.sp,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget pageBar() {
    return Row(
      children: List.generate(
        3,
        (index) => GestureDetector(
            onTap: () {
              // setState(() {
              //   _currentIndex = 2;
              // });
              showDialog(
                context: context,
                builder: (_) {
                  return thirdStage();
                },
              );
            },
            child: circleBar(index == 1 ? true : false)),
      ),
    );
  }
}
