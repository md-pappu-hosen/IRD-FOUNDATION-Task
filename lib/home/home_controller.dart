import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedCategory = 0.obs;
  var selectedDrawerItem = 'Home'.obs;
  var isDrawerOpen = false.obs;

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  final categories = ['House', 'Apartment', 'Hotel', 'Villa'];
}
