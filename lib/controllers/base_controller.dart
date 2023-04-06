import 'package:get/get.dart';

class BaseController extends GetxController {
  RxBool isLoading = false.obs;

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }
}
