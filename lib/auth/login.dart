import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _email, _pass;
  bool hideText = true, enabtn = true, _loadBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log-in'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _email,
                  text: 'Email Address',
                  hintText: 'youremail@here.com',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern.toString());
                    if (!regex.hasMatch(value!)) {
                      return 'Invalid email address';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _pass,
                  secure: hideText,
                  text: 'Password',
                  hintText: '•••••••••••',
                  textInputAction: TextInputAction.done,
                  icon: IconButton(
                    onPressed: () => _togglehide(),
                    icon: hideText
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'password cannot be less than 6 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70.h),
                ButtonWidget(
                  btnName: 'LOGIN',
                  enabtn: enabtn,
                  startLoad: _loadBtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(height: 32.h),
                Text.rich(
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.kwhite,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed('/register');
                      },
                    children: [
                      TextSpan(
                        text: 'Sign-up',
                        style: const TextStyle(
                          color: AppColors.kprimary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed('/register');
                          },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 80.h),
                Row(
                  children: [
                    SizedBox(width: 35.w),
                    const Expanded(
                      flex: 3,
                      child: Divider(
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'Or login with ',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.kwhite,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    const Expanded(
                      flex: 3,
                      child: Divider(color: Colors.white54),
                    ),
                    SizedBox(width: 35.w),
                  ],
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 30.w),
                    SvgPicture.asset('assets/svgs/google.svg'),
                    SvgPicture.asset('assets/svgs/facebook.svg'),
                    SvgPicture.asset('assets/svgs/apple.svg'),
                    SizedBox(width: 30.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _togglehide() {
    setState(() {
      hideText = !hideText;
    });
  }

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  void dispose() {
    _email!.clear();
    _pass!.clear();
    super.dispose();
  }
}

