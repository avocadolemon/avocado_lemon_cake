import 'package:avocado_lemon_cake/widgets/theme_swtich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerMdenu extends StatelessWidget {
  const DrawerMdenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage('assets/images/image-222.png'),
                  radius: 24.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Robin wood',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Text(
                      'Robinwood@gmail.com',
                      style: TextStyle(
                        color: Color.fromARGB(255, 158, 154, 154),
                      ),
                    ),
                    Row(
                      children: [
                        const Text('Edit Details',
                            style: TextStyle(
                                color: Color.fromARGB(255, 158, 154, 154))),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.save_as,
                          color: Color.fromARGB(255, 158, 154, 154),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )),
          const ListTile(
            title: Text(
              'Add Community',
              style: TextStyle(color: Colors.green),
            ),
            leading: Icon(
              Icons.people_outline,
              color: Colors.green,
            ),
          ),
          const ListTile(
            title: Text('Alert Management'),
            leading: Icon(Icons.notifications),
          ),
          const ListTile(
            title: Text(
              'Community survey',
              style: TextStyle(color: Color(0xffffcc00)),
            ),
            leading: Icon(Icons.menu_book),
          ),
          const ListTile(
            title: Text('FAQ'),
            leading: Icon(Icons.question_mark_outlined),
          ),
          const ListTile(
            title: Text('Terms of use & Policy'),
            leading: Icon(
              Icons.note_alt_sharp,
            ),
          ),
          const ListTile(
            title: Text('Tell My Friends'),
            leading: Icon(Icons.person_add),
          ),
          const ListTile(
            title: Text('About Us'),
            leading: Icon(Icons.person_outline),
          ),
          const ListTile(
            title: Text('Support & Bugs'),
            leading: Icon(Icons.phone),
          ),
          const ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(
              Icons.door_front_door,
              color: Colors.red,
            ),
          ),
          const ListTile(
            leading: SwitchThemeColor(),
            title: Text('Change Theme'),
          ),
          SizedBox(
            height: 20.h,
          ),
          const ListTile(
            leading:
                Image(image: AssetImage('assets/images/alc_logo_white.png')),
          )
        ],
      ),
    );
  }
}
