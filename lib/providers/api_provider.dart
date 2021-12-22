import 'package:dio/dio.dart';
import 'package:ortez_app/models/category_model.dart';
import 'package:ortez_app/utils/object_factory.dart';

class ApiProvider {
  Future<Response> getSignUp({
    required String firstName,
    required String email,
    required String phone,
    required String lastName,
    required String otp,
  }) async {
    final response = await ObjectFactory().apiClient.signUp(
        lastName: lastName,
        email: email,
        firstName: firstName,
        otp: otp,
        phone: phone);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      return response;
    }
  }

  Future getCategories() async {
    final response = await ObjectFactory().apiClient.getCategories();
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('${response.data[0]['Data']} response.data');
      return (response.data[0]['Data']);
    } else {
      return null;
    }
  }

  Future getItems({int? itemGroupId}) async {
    final response =
        await ObjectFactory().apiClient.getItems(itemGroupId: itemGroupId);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return (response.data[0]['Data']);
    } else {
      return null;
    }
  }
}
