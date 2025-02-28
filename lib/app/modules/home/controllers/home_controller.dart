import 'dart:convert';

import 'package:get/get.dart';
import 'package:technical_test/app/modules/home/models/user_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final count = 0.obs;
  var isLoading = false.obs;
  var userModel = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<UserModel> getUsers({required int page}) async {
    String url = 'https://reqres.in/api/users?page=$page';

    var response = await http.get(Uri.parse(url));

    isLoading(true);

    await Future.delayed(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      isLoading(false);

      UserModel user = UserModel.fromJson(data);

      userModel.value = user;

      return user;
    } else {
      var data = jsonDecode(response.body);

      isLoading(false);
      Get.snackbar('Oops sorry', data);
      throw Exception();
    }
  }

  void increment() => count.value++;
}
