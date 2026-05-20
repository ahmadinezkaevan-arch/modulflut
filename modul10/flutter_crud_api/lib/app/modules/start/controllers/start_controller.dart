import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_crud_api/app/data/user_model.dart';
import '../../../services/auth_api.dart';
import '../../../routes/app_pages.dart';

class StartController extends GetxController {
  bool startScreen = false;

  Future<void> autoLogin() async {
    String? token = box.read("token");
    
    if (token != null && token.isNotEmpty && token != "BadToken") {
      // Token exists, validate it with API
      userModel = await AuthApi().checkTokenApi(token);
      
      if (userModel?.status == 200) {
        Get.offAndToNamed(Routes.HOME);
      } else {
        startScreen = true;
        loginScreen = true;
        update();
      }
    } else {
      startScreen = true;
      loginScreen = true;
      update();
    }
  }

  UserModel? userModel;
  final box = GetStorage();
  bool loginScreen = false;
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  Future login() async {
    loginScreen = false;
    update();
    userModel = await AuthApi().loginAPI(emailC.text, passC.text);
    if (userModel!.status == 200) {
      await box.write("token", userModel!.accessToken);
      await box.write("name", userModel!.name);
      await box.write("email", userModel!.email);
      update();
      Get.offAndToNamed(Routes.HOME);
    } else if (userModel!.status == 404) {
      loginScreen = true;
      update();
    }
  }
}
