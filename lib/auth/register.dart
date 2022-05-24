import 'package:avocado_lemon_cake/function/repository/auth_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/textformfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _name, _email, _pass, _age;
  bool hideText = true, enabtn = true, _loadBtn = false;
  int? selectedIndex;
  String? _selectedValue;
  final String _sex = '';
  List<String> itemName = ['female', 'male'];
  final AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Text(
                  "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Pulvinar tristique congue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.kwhite,
                  ),
                ),
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _name,
                  text: 'Full Name',
                  hintText: 'John Doe',
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'Kindly enter your full name';
                    } else {
                      return null;
                    }
                  },
                ),
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
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldWidget(
                        controller: _age,
                        text: 'Age',
                        hintText: '',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Age cannot be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 32.h),
                    Expanded(
                      child: DropDownWidget(
                        text: 'Gender',
                        hintText: _sex,
                        value: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value;
                            selectedIndex = itemName.indexOf(value);
                          });
                        },
                        items: itemName.map((val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70.h),
                ButtonWidget(
                  btnName: 'Sign-up',
                  enabtn: enabtn,
                  startLoad: _loadBtn,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Future.value(
                        _authRepository.createWithEmailAndPwd(
                            _email!.text,
                            _pass!.text,
                            context,
                            _name!.text,
                            _age!.text,
                            _selectedValue!),
                      );
                    }
                  },
                ),
                SizedBox(height: 50.h),
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
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 30.w),
                    GestureDetector(
                      onTap: () => context
                          .read<AuthRepository>()
                          .signInWithGmail(context),
                      child: SvgPicture.asset('assets/svgs/google.svg'),
                    ),
                    GestureDetector(
                        onTap: () => context
                            .read<AuthRepository>()
                            .signInWithFacebook(context),
                        child: SvgPicture.asset('assets/svgs/facebook.svg')),
                    SvgPicture.asset('assets/svgs/apple.svg'),
                    SizedBox(width: 30.w),
                  ],
                ),
                SizedBox(height: 32.h),
                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.kwhite,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pushNamed('/login');
                      },
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: AppColors.kprimary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed('/login');
                          },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 72.h),
                Text.rich(
                  TextSpan(
                    text: '“By continuing your agree to Avocado Lemon Cake. ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.kwhite,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Services',
                        style: const TextStyle(
                            color: AppColors.kprimary,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text:
                            ' We will manage information about you are described in our ',
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: const TextStyle(
                            color: AppColors.kprimary,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: '.”'),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
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
    _name = TextEditingController();
    _email = TextEditingController();
    _age = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  void dispose() {
    _name!.clear();
    _email!.clear();
    _age!.clear();
    _pass!.clear();
    super.dispose();
  }
}
