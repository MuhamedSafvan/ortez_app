import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ortez_app/providers/api_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends ChangeNotifier {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String statusMessage = "";
  bool? _isValid;

  Future<bool> getSignUp() async {
    final val = await ApiProvider().getSignUp(
      firstName: firstnameController.text,
      lastName: lastnameController.text,
      phone: mobileController.text,
      email: emailController.text,
      otp: otpController.text,
    );
    _isValid = EmailValidator.validate(emailController.text);
    print(_isValid);
    if (_isValid == true) {
      if (val.statusCode == 200 || val.statusCode == 201) {
        // LoginResponse res = LoginResponse.fromJson(val.data);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('apiKey', res.data.apiKey);
        // await prefs.setString('role', res.data.userDetails.role);
        // api = res.data.apiKey;
        notifyListeners();
        return true;
      }
      if (val.statusCode == 204) {
        statusMessage = 'User already exists';
        notifyListeners();
        return false;
      } else {
        statusMessage = 'All fields are required';
        notifyListeners();
        return false;
      }
    } else {
      statusMessage = 'Please check the email';
      notifyListeners();
      return false;
    }
  }
}
