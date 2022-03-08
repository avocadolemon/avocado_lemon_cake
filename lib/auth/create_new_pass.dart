import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _cpass, _pass;
  bool hideText = true, enabtn = true, _loadBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    'Create new password',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    'Your new password must be different from the previous used password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 42.h),
                  TextFormFieldWidget(
                    controller: _pass,
                    secure: hideText,
                    text: 'Password',
                    hintText: '•••••••••••',
                    textInputAction: TextInputAction.next,
                    icon: IconButton(
                      onPressed: () => _togglehide(),
                      icon: hideText
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Must be at least 8 characters.';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 36.h),
                  TextFormFieldWidget(
                    controller: _cpass,
                    secure: hideText,
                    text: 'Confirm Password',
                    hintText: '•••••••••••',
                    textInputAction: TextInputAction.done,
                    icon: IconButton(
                      onPressed: () => _togglehide(),
                      icon: hideText
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                    validator: (value) {
                      if (value != _pass!.text) {
                        return 'Both password must match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 170.h),
                  ButtonWidget(
                    btnName: 'Reset Password',
                    enabtn: enabtn,
                    startLoad: _loadBtn,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed('/pass-success');
                      }
                    },
                  ),
                ],
              ),
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
    _cpass = TextEditingController();
    _pass = TextEditingController();
  }

  @override
  void dispose() {
    _cpass!.clear();
    _pass!.clear();
    super.dispose();
  }
}
