import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../services/post_api.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/custom_alert_dialog.dart';
import '../../../widgets/loading.dart';
import '../../../data/post_model.dart';

class HomeController extends GetxController {
  PostListModel? posts;
  final box = GetStorage();
  bool homeScreen = false;
  
  @override
  void onInit() {
    super.onInit();
    loadPost();
  }
  loadPost() async {
    homeScreen = false;
    update();
    showLoading();
    posts = await PostApi().loadPostAPI();
    update();
    stopLoading();
    if (posts?.status == 200) {
    } else if (posts!.status == 204) {
      print("Empty");
    } else if (posts!.status == 404) {
      homeScreen = true;
      update();
    } else if (posts!.status == 401) {
    } else {
      print("someting wrong 400");
    }
  }

  logout() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Logout System",
      message: "Apakah anda yakin akan logout dari sistem ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        Get.back(); // back page
        try {
          box.remove("token");
          box.remove("name");
          box.remove("email");
          update();
          await Get.offAllNamed(Routes.LOGIN);
        } catch (e) {}
      },
    );
  }
}
