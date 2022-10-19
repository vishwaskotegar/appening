import 'dart:convert';
import 'dart:developer';

import 'package:appening/models/user_data_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class UserController extends getx.GetxController {
  createUser(String name, String job) async {
    Response response = await Dio().post(
      "https://reqres.in/api/users",
      data: {"name": name, "job": job},
    );
    if (response.statusCode == 201) {
      log(response.toString());
      getx.Get.showSnackbar(
        const getx.GetSnackBar(
          animationDuration: Duration(milliseconds: 200),
          duration: Duration(seconds: 3),
          message: "User Created Succesfully",
        ),
      );
    }
  }

  Future<UserDataModel> showAllUsers() async {
    Response response = await Dio().get("https://reqres.in/api/users?page=2");

    UserDataModel userDataModel =
        UserDataModel.fromJson(jsonEncode(response.data));
    // if (kDebugMode) {
    //   print(userDataModel);
    // }
    return userDataModel;
  }
}
