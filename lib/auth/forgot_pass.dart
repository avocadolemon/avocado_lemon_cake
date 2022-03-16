import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/button_widget.dart';
import '../widgets/textformfield_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  bool enabtn = true, _loadBtn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
      ),
      body: Padding(
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
              SizedBox(height: 20.h),
              Text(
                'Enter your registered Email below to receive Password reset instruction.',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 170.h),
              ButtonWidget(
                btnName: 'SEND',
                enabtn: enabtn,
                startLoad: _loadBtn,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed('/check-mail');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
