import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ortez_app/controllers/signup_controller.dart';
import 'package:ortez_app/utils/constants.dart';
import 'package:provider/provider.dart';

import 'category_screen.dart';

//Widget for input

class SignUpScreen extends StatefulWidget {
  @override
  SignUpState createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUpScreen> {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  Dio dio = Dio();

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpController>(builder: (context, model, _) {
      return Scaffold(
          body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          child: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                          // color: Constants.themeGradients[0],
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: model.firstnameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Constants.themeGradients[0],
                                  width: 5)),
                          hintText: "First Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the First Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: model.lastnameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Constants.themeGradients[0],
                                  width: 5)),
                          hintText: "Last Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Last Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: model.emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Constants.themeGradients[0],
                                  width: 5)),
                          hintText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter Email';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: model.mobileController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Constants.themeGradients[0],
                                  width: 5)),
                          hintText: "Mobile"),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter the Mobile';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      controller: model.otpController,
                      decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Get OTP'),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                  color: Constants.themeGradients[0],
                                  width: 5)),
                          hintText: "OTP"),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter the OTP';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        int count = 0;
                        _form.currentState!.validate();
                        print('${model.statusMessage} Status Message');
                        await context.read<SignUpController>().getSignUp().then(
                            (value) => value
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => CategoryScreen()))
                                : showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: Container(
                                          height: 100,
                                          width: 200,
                                          child: Center(
                                            child: Text(model.statusMessage),
                                          ),
                                        ),
                                      );
                                    }));
                      },
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 20,
                          color: Constants.themeGradients[1],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Constants.themeGradients[0],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 60)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Already have an account"),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
