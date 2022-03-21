import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/dropdown_widget.dart';
import '../../widgets/textformfield_widget.dart';

class EditPersonalData extends StatefulWidget {
  const EditPersonalData({Key? key}) : super(key: key);

  @override
  State<EditPersonalData> createState() => _EditPersonalDataState();
}

class _EditPersonalDataState extends State<EditPersonalData> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _name, _email, _pass, _age;
  bool hideText = true, enabtn = true, _loadBtn = false;
  int? selectedIndex;
  String? _selectedValue;
  String _sex = '';
  List<String> itemName = ['female', 'male'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Personal Data')),
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
                  controller: _age,
                  text: 'Age',
                  hintText: '22',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Age cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _age,
                  text: 'City',
                  hintText: 'Los Andes',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _age,
                  text: 'Neighborhood',
                  hintText: '',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 32.h),
                TextFormFieldWidget(
                  controller: _age,
                  text: 'Street',
                  hintText: 'Corper Street',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'City cannot be empty';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 87.h),
                Text(
                  '*Please Note: Any change of Location , City / Neighborhood / Street will cause changes in the community - /themes / group ups and may result in their removal.',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 67.h),
                ButtonWidget(
                  btnName: 'Save Details',
                  enabtn: enabtn,
                  startLoad: _loadBtn,
                  onPressed: () {
                    Navigator.pushNamed(context, "/communitySurvey");
                    // if (_formKey.currentState!.validate()) {

                    // }
                  },
                ),
                SizedBox(height: 50.h),
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
